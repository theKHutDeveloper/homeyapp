class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [ :edit, :update, :show, :destroy ]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_content
    end
  end

  def show
    @status_changes = @project.status_changes.order(created_at: :asc)
    @comments = @project.comments.order(created_at: :asc)
  end

  def edit
  end

  def update
    if params[:project][:status] && @project.status != params[:project][:status]
      new_status_key = params[:project][:status]

      @project.status_changes.create!(
        user: current_user,
        user_name: current_user.name,
        new_status: Project.statuses[new_status_key]
      )
      @project.update(status: params[:project][:status])
    end

    redirect_to @project
  end

  def destroy
    @project.destroy
    redirect_to projects_path, status: :see_other, notice: "Project successfully deleted!"
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :status, :user_name, :user_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

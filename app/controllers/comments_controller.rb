class CommentsController < ApplicationController
  before_action :require_login

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params.merge(user: current_user, user_name: current_user.name))

    if @comment.save!
      redirect_to @project
    else
      redirect_to @project, alert: "Failed to add comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :product_id, :user_id, :user_name)
  end
end

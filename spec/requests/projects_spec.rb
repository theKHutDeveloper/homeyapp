require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user, user_id: user.id, user_name: user.name) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "GET /index" do
    it "renders the index page successfully" do
      get projects_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /new" do
    it "renders the new project page" do
      get new_project_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) { attributes_for(:project, status: 'pending', user_id: user.id, user_name: user.name) }
    let(:invalid_attributes) { { title: "", description: "" } }

    context "with valid parameters" do
      it "creates a new project and redirects" do
        expect {
          post projects_path, params: { project: valid_attributes }
        }.to change(Project, :count).by(1)

        expect(response).to redirect_to(project_path(Project.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a project and renders new template" do
        expect {
          post projects_path, params: { project: invalid_attributes }
        }.not_to change(Project, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /show" do
    it "renders the show page" do
      get project_path(project)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /edit" do
    it "renders the edit page" do
      get edit_project_path(project)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH /update" do
    let(:new_attributes) { { title: "Updated Project Title" } }

    context "when changing project status" do
      it "creates a status change record and updates status" do
        expect {
          patch project_path(project), params: { project: { status: "completed" } }
        }.to change(project.status_changes, :count).by(1)

        project.reload
        expect(project.status).to eq("completed")
        expect(response).to redirect_to(project_path(project))
      end
    end
  end

  describe "DELETE /destroy" do
    it "deletes the project and redirects" do
      project

      expect {
        delete project_path(project)
      }.to change(Project, :count).by(-1)

      expect(response).to redirect_to(projects_path)
      follow_redirect!
      expect(response.body).to include("Project successfully deleted!")
    end
  end
end

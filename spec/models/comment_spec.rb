require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:project) { create(:project, user_id: user.id, user_name: user.name) }

  it "is valid" do
    comment = Comment.create!(project_id: project.id, user_id: user.id, content: "This is my first comment for this project")
    expect(comment).to be_valid
    expect(comment.user_name).to eq user.name
  end

  it "is not valid without a project" do
    comment = Comment.new(user_id: user.id, content: "This is my first comment for this project")
    expect(comment).not_to be_valid
  end

  it "is not valid without a user" do
    comment = Comment.new(project_id: project.id, content: "This is my first comment for this project")
    expect(comment).not_to be_valid
  end

  it "is not valid without content" do
    comment = Comment.new(project_id: project.id, user_id: user.id)
    expect(comment).not_to be_valid
  end
end

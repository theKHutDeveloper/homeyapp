require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:user) { create(:user) }

  it "is valid" do
    project = Project.new(title: "First Project", user_id: user.id, user_name: user.name)
    expect(project.status).to eq "pending"
    expect(project).to be_valid
  end

  it "is not valid without a title" do
    project = Project.new(description: "My first project")
    expect(project).not_to be_valid
  end

  it "is not valid if title is not unique" do
    project1 = Project.create!(title: "First Project", user_id: user.id, user_name: user.name)
    project2 = Project.new(title: "First Project", user_id: user.id, user_name: user.name)

    expect(project1).to be_valid
    expect(project2).not_to be_valid
    expect(project2.errors[:title]).to include "has already been taken"
  end

  it "is not valid with an invalid status" do
    project = Project.new(title: "First Project", status: 99)
    expect(project).not_to be_valid
    expect(project.errors["status"]).to eq [ "can't be blank", "is not included in the list" ]
  end
end

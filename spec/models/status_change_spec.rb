require 'rails_helper'

RSpec.describe StatusChange, type: :model do
  let(:user) { create(:user) }
  let(:project) { create(:project, user_id: user.id, user_name: user.name) }

  it "is valid" do
    status_change = StatusChange.create!(project_id: project.id, user_id: user.id, new_status: 1)
    expect(status_change).to be_valid
    expect(status_change.user_name).to eq user.name
  end

  it "is not valid without a project" do
    status_change = StatusChange.new(user_id: user.id, new_status: 1)
    expect(status_change).not_to be_valid
  end

  it "is not valid without a user" do
    status_change = StatusChange.new(project_id: project.id, new_status: 1)
    expect(status_change).not_to be_valid
  end

  it "is not valid without a new_status" do
    status_change = StatusChange.new(project_id: project.id, user_id: user.id)
    expect(status_change).not_to be_valid
  end
end

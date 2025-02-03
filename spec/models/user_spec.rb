require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid" do
    user = User.new(name: "John Bloggs", email: "john_bloggs@example.com", password_digest: "pa5sw03d")
    expect(user).to be_valid
  end

  it "is not valid without name" do
    user = User.new(email: "john_bloggs@example.com", password_digest: "pa5sw03d")
    expect(user).not_to be_valid
  end

  it "is not valid without email" do
    user = User.new(name: "John Bloggs", password_digest: "pa5sw03d")
    expect(user).not_to be_valid
  end

  it "is not valid with an invalid email" do
    user = User.new(name: "John Bloggs", email: "john_bloggs£example.com", password_digest: "pa5sw03d")
    expect(user).not_to be_valid
  end

  it "is not valid if email is not unique" do
    user1 = User.create!(name: "John Bloggs", email: "john_bloggs@example.com", password_digest: "pa5sw03d")
    user2 = User.new(name: "Johnny Bloggs", email: "john_bloggs@example.com", password: 'mYpa5sw03d')

    expect(user1).to be_valid
    expect(user2).to_not be_valid
    expect(user2.errors[:email]).to include('has already been taken')
  end

  it "is not valid without password" do
    user = User.new(name: "John Bloggs", email: "john_bloggs@example.com")
    expect(user).not_to be_valid
  end

  it "is not valid with a password length less than 8" do
    user = User.new(name: "John Bloggs", email: "john_bloggs@example.com", password_digest: "w03d")
    expect(user).not_to be_valid
  end
end

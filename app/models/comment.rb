class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true

  before_validation :set_user_info, on: :create

  validates :content, presence: true

  validates :user, presence: true, on: :create
  validates :user_name, presence: true

  private

  def set_user_info
    self.user_name = user.name if user.present?
  end
end

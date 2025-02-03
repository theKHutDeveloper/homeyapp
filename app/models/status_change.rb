class StatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true

  before_validation :set_user_info, on: :create

  validates :new_status, presence: true
  validates :user_name, presence: true

  private

  def set_user_info
    self.user_name = user.name if user.present?
  end
end

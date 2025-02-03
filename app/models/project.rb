class Project < ApplicationRecord
  belongs_to :user, optional: true

  enum :status, [ :pending, :in_progress, :blocked, :completed, :archived ]

  before_validation :set_user_info, on: :create

  validates :title, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: Project.statuses.keys }

  validates :user, presence: true, on: :create
  validates :user_name, presence: true

  def status=(value)
    if Project.statuses.value?(value.to_i) || Project.statuses.key?(value.to_s)
      super(value)
    else
      self[:status] = nil
    end
  end

  private

  def set_user_info
    self.user_name = user.name if user.present?
  end
end

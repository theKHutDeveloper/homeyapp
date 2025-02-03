class Project < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy

  enum :status, [ :pending, :in_progress, :blocked, :completed, :archived ]

  before_validation :set_user_info, on: :create
  after_commit :log_initial_status, on: :create

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

  def log_initial_status
    status_changes.create!(
      new_status: Project.statuses[status],
      user_id: user.id,
      user_name: user.name
    )
  end
end

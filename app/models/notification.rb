
class Notification < ApplicationRecord
  belongs_to :usuario
  validates :message, presence: true
  validates :status, inclusion: { in: %w[unread read] }
end

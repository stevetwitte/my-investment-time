class Status < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :invest

  after_save :process_notifications

  validates :title,
            presence: true

  private

  def process_notifications
    NotificationService.process_invest(invest)
  end
end

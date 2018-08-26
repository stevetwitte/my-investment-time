module Activity
  class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :invest

    validates :status,
              presence: true

    enum status: { pending: 0, dismissed: 1 }
  end
end

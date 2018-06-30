module Activity
  class Invite < ApplicationRecord
    belongs_to :team
    belongs_to :user

    attr_accessor :member_email

    validates :member_email,
              presence: true,
              email: true,
              if: -> { new_record? || email.present?}

    validates :status,
              presence: true

    enum status: {pending: 0, accepted: 1, rejected: 2}
  end
end

class Status < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :invest

  validates :title,
            presence: true
end

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :invest

  validates :user,
            presence: true

  validates :invest,
            presence: true
end

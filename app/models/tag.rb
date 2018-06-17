class Tag < ApplicationRecord
  has_many :taggings
  has_many :invests, through: :taggings

  validates :name,
            presence: true
end

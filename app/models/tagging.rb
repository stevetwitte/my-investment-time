class Tagging < ApplicationRecord
  belongs_to :invest
  belongs_to :tag

  validates :invest,
            presence: true

  validates :tag,
            presence: true
end

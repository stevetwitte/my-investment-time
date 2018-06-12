class Invest < ApplicationRecord
  belongs_to :user
  has_many :statuses, dependent: :destroy

  after_create :create_initial_status

  validates :user,
            presence: true

  validates :title,
            presence: true

  validates :body,
            presence: true

  private

  def create_initial_status
    self.statuses << Status.create!(title: 'Investment Started', user: self.user, invest: self)
  end
end

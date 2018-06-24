class Team < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :team_members
  has_many :members, through: :team_members, source: "user"

  validates :name,
            presence: true

  validates :slug,
            presence: true,
            uniqueness: true, case_sensitive: false

  before_create :create_slug

  private

  def create_slug
    self.slug = name.strip().downcase.gsub(' ', '-')
  end
end

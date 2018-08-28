class Team < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :team_members
  has_many :members, through: :team_members, source: "user"
  has_many :activity_invites, class_name: "Activity::Invite"

  validates :name,
            presence: true

  validates :slug,
            presence: true,
            uniqueness: true, case_sensitive: false,
            format: { with: /\A[a-zA-Z0-9\.\-\_]+\Z/,
                      message: "only allows letters, numbers, underscores, periods and dashes" }

  before_save :downcase_fields

  def to_param
    slug
  end

  private

  def downcase_fields
    self.slug.downcase!
  end
end

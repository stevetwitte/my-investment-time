class User < ApplicationRecord
  include Clearance::User

  has_one :profile, dependent: :destroy
  has_many :invests, dependent: :destroy
  has_many :statuses
  has_many :likes
  has_many :team_members
  has_many :teams, through: :team_members
  has_many :activity_invites, class_name: "Activity::Invite"
  has_many :follows, dependent: :destroy
  has_many :following_invests, through: :follows, source: "invest"

  before_save :downcase_fields
  after_create :create_profile

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            email: true,
            if: -> { new_record? || email.present?}


  validates :password,
            presence: true,
            length: { minimum: 8 },
            if: -> { new_record? || password.present? }


  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[a-zA-Z0-9\.\-\_]+\Z/,
                      message: "only allows letters, numbers, " +
                        "underscores, periods and dashes" },
            if: -> { new_record? || username.present? }

  def to_param
    username
  end

  def notifications
    activity_invites.pending
  end

  private

  def create_profile
    self.profile = Profile.create!(user: self)
  end

  def downcase_fields
    email.downcase!
    username.downcase!
  end
end

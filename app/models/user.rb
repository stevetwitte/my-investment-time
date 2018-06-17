class User < ApplicationRecord
  include Clearance::User

  has_one :profile, dependent: :destroy
  has_many :invests, dependent: :destroy
  has_many :statuses
  has_many :likes

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
            if: -> { new_record? || username.present? }

  def to_param
    username
  end

  private

  def create_profile
    self.profile = Profile.create!(user: self)
  end
end

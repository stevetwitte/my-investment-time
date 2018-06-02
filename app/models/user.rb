class User < ApplicationRecord
  include Clearance::User

  has_many :invests, dependent: :destroy

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

end

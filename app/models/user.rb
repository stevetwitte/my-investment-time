class User < ApplicationRecord
  include Clearance::User

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            email: true, if: :should_validate?

  validates :password,
            presence: true,
            length: { minimum: 8 }

  def should_validate?
    new_record? || email.present?
  end
end

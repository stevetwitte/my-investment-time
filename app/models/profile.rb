class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validate :correct_avatar_mime_type

  private

  def correct_avatar_mime_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
      errors.add(:document, "must be a JPEG or a PNG image")
    end
  end
end

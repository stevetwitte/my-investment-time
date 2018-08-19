module ApplicationHelper
  def following?(user:, invest:)
    user.following_invests.include?(invest)
  end

  def liked?(user:, invest:)
    user.liked_invests.include?(invest)
  end
end

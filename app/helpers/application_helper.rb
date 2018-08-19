module ApplicationHelper
  def following?(user:, invest:)
    user.following_invests.include?(invest)
  end
end

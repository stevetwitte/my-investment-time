module NotificationService
  def self.process_invest(invest)
    invest.following_users.each do |i|
      Activity::Notification.create!(user: i, invest: invest)
    end
  end
end
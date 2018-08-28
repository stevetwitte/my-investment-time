class Invest < ApplicationRecord
  belongs_to :user
  has_many :statuses, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :likes
  has_many :follows, dependent: :destroy
  has_many :following_users, through: :follows, source: "user"

  before_save :process_tags
  after_create :create_initial_status
  after_update :process_notifications

  validates :user,
            presence: true

  validates :title,
            presence: true

  validates :body,
            presence: true

  def set_tags(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

  def add_tag(name)
    self.tags << Tag.where(name: name.strip.downcase).first_or_create!
  end

  private

  def process_notifications
    NotificationService.process_invest(self)
  end

  def create_initial_status
    statuses << Status.create!(title: "Investment Started",
                               user: user,
                               invest: self)
  end

  def process_tags
    extracted_tags = self.body.scan(/#(\w+)/).uniq.flatten
    self.tags = extracted_tags.map do |name|
      Tag.where(name: name.downcase).first_or_create!
    end
  end
end

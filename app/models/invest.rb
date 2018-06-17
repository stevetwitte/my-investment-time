class Invest < ApplicationRecord
  belongs_to :user
  has_many :statuses, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :likes

  before_save :process_tags
  after_create :create_initial_status

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

  def create_initial_status
    self.statuses << Status.create!(title: 'Investment Started', user: self.user, invest: self)
  end

  def process_tags
    extracted_tags = self.body.scan(/#(\w+)/).uniq.flatten
    self.tags = extracted_tags.map do |name|
      Tag.where(name: name.downcase).first_or_create!
    end
  end
end

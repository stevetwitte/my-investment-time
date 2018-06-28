class TeamRegistraionForm
  include ActiveModel::Model

  attr_accessor :user,
                :name,
                :slug,
                :description,
                :links

  validates :user,
            presence: true

  validates :name,
            presence: true

  validates :slug,
            presence: true

  def save
    false unless valid?

    ActiveRecord::Base.transaction do
      create_team
    end
  rescue ActiveRecord::RecordInvalid => e
    errors.add("validation", "unknown failure")
  end
end
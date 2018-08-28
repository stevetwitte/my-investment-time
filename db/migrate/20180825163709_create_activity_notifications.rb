class CreateActivityNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_notifications do |t|
      t.belongs_to :user, index: true
      t.belongs_to :invest, index: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end

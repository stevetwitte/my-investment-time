class CreateActivityInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_invites do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end

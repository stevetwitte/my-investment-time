class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :full_name
      t.string :bio
      t.jsonb :links

      t.timestamps
    end
  end
end

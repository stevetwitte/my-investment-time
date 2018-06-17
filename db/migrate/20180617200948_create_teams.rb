class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end

class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :title
      t.text :detail
      t.references :invest, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

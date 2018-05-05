class CreateInvests < ActiveRecord::Migration[5.2]
  def change
    create_table :invests do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end

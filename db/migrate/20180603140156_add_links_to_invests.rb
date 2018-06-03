class AddLinksToInvests < ActiveRecord::Migration[5.2]
  def change
    add_column :invests, :links, :jsonb
  end
end

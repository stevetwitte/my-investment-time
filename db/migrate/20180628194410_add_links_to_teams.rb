class AddLinksToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :links, :jsonb
  end
end

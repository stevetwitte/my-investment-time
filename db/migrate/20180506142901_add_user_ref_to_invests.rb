class AddUserRefToInvests < ActiveRecord::Migration[5.2]
  def change
    add_reference :invests, :user, foreign_key: true
  end
end

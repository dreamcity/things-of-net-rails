class AddCsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cs, :boolean
  end
end

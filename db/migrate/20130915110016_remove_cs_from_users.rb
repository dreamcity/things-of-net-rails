class RemoveCsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :cs, :boolean
  end
end

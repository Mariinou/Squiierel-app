class AddApprovedToUser < ActiveRecord::Migration
  def change
    add_column :users, :approved, :boolean, :default => false, :null => false
    remove_column :users, :state
  end
end

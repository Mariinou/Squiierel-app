class Voila < ActiveRecord::Migration
  def change
	remove_column :annonces, :type
	add_column :annonces, :genre, :string 
  end
end

class ModifyAnnonceEtatAndValidee < ActiveRecord::Migration
  def change
      remove_column :annonces, :etat
      remove_column :annonces, :validee
      add_column :annonces, :validee, :boolean, :default => false, :null => false
      add_column :annonces, :etat, :boolean, :default => true, :null => true
  end
end

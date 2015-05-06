class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :entreprise
      t.string :titre
      t.string :type
      t.string :description
      t.string :duree
      t.date :datedebut
      t.string :moyencontact
      t.boolean :etat
      t.boolean :validee

      t.timestamps null: false
    end
  end
end

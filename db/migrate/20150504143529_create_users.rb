class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :mdp
      t.string :email
      t.boolean :state

      t.timestamps null: false
    end
  end
end

class Addfilstousers < ActiveRecord::Migration
  def change
      add_column :users, :promo, :integer
      add_column :users, :numtel, :string
      add_column :users, :role, :string
  end
end

class CreateFoodInventory < ActiveRecord::Migration[7.0]
  def change
    create_table :food_inventories do |t|
      
      t.references :food, null: false, foreign_key: {to_table: :foods}
      t.references :inventory, null: false, foreign_key: {to_table: :inventories}
      t.integer :quantity

      t.timestamps
    end
  end
end

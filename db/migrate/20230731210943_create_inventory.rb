# frozen_string_literal: true

class CreateInventory < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

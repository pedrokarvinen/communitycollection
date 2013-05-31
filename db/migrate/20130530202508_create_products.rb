class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :brand
      t.string :prod_id
      t.string :name
      t.string :color
      t.float :price
      t.text :description
      t.string :genre

      t.timestamps
    end
    add_index :products, :brand_id
  end
end

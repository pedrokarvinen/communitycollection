class CreateCategoriesProductsTable < ActiveRecord::Migration
  def up
    create_table :categories_products, :id => false do |t|
        t.references :product
        t.references :category
    end
    add_index :categories_products, [:product_id, :category_id]
  end

  def down
    drop_table :categories_products
  end
end

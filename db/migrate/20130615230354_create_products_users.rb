class CreateProductsUsers < ActiveRecord::Migration
  def change
    create_table :products_users do |t|
      t.references :product
      t.references :user

      t.timestamps
    end
    add_index :products_users, :product_id
    add_index :products_users, :user_id
  end
end

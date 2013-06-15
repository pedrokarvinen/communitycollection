class CreateBrandsUsers < ActiveRecord::Migration
  def change
    create_table :brands_users do |t|
      t.references :user
      t.references :brand

      t.timestamps
    end
    add_index :brands_users, :user_id
    add_index :brands_users, :brand_id
  end
end

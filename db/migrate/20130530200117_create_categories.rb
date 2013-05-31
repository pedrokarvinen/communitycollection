class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cat_id
      t.string :name
      t.string :kind
      t.string :genre
      t.references :brand
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :parent_id

      t.timestamps
    end
    add_index :categories, :brand_id
  end
end

class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product
      t.string :image_path
      t.string :thumb_path
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
    add_index :images, :product_id
  end
end

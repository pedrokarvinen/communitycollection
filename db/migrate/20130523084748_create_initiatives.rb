class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.references :brand
      t.string :name
      t.string :slug
      t.text :about
      t.string :thumbnail
      t.text :splash
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
    add_index :initiatives, :brand_id
  end
end

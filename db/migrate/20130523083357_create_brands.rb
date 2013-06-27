class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.references :user
      t.string :name
      t.string :slug
      t.text :about
      t.string :thumbnail
      t.timestamp :created_at
      t.timestamp :updated_at  
    end
    
    add_index :brands, :user_id
    
  end
end

class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :user
      t.references :brand
      t.string :page_url
      t.string :ip_address
      t.timestamp :visited_at

      t.timestamps
    end
    add_index :tracks, :user_id
    add_index :tracks, :brand_id
  end
end

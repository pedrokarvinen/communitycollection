class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :initiative
      t.string :title
      t.string :slug
      t.text :body
      t.string :thumbnail
      t.text :splash
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
    add_index :articles, :initiative_id
  end
end

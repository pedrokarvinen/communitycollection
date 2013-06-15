class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.references :brand
      t.boolean :is_deleted
      t.timestamp :created_at

      t.timestamps
    end
    add_index :messages, :brand_id
  end
end

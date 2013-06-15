class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.references :message
      t.boolean :is_read
      t.boolean :is_deleted
      t.timestamp :created_at

      t.timestamps
    end
    add_index :replies, :message_id
  end
end

class CreateMessagesUsers < ActiveRecord::Migration
  def change
    create_table :messages_users do |t|
      t.references :message
      t.references :user
      t.boolean :is_read
      t.boolean :is_deleted
      t.timestamp :created_at

      t.timestamps
    end
    add_index :messages_users, :message_id
    add_index :messages_users, :user_id
  end
end

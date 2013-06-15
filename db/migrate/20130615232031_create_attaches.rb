class CreateAttaches < ActiveRecord::Migration
  def change
    create_table :attaches do |t|
      t.references :message
      t.string :file_path
      t.string :type
      t.timestamp :created_at

      t.timestamps
    end
    add_index :attaches, :message_id
  end
end

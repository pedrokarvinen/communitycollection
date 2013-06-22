class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :kind
      t.string :facebook_auth_id
      t.string :twitter_auth_id
      t.boolean :is_active
      t.boolean :is_deleted
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :auth_hash

    end
  end
end

class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :gendre
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :avatar
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end

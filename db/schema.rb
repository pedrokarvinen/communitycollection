# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130615233350) do

  create_table "articles", :force => true do |t|
    t.integer  "initiative_id"
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.string   "thumbnail"
    t.text     "splash"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "articles", ["initiative_id"], :name => "index_articles_on_initiative_id"

  create_table "attaches", :force => true do |t|
    t.integer  "message_id"
    t.string   "file_path"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attaches", ["message_id"], :name => "index_attaches_on_message_id"

  create_table "brands", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "slug"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["user_id"], :name => "index_brands_on_user_id"

  create_table "brands_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "brand_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "brands_users", ["brand_id"], :name => "index_brands_users_on_brand_id"
  add_index "brands_users", ["user_id"], :name => "index_brands_users_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "cat_id"
    t.string   "name"
    t.string   "kind"
    t.string   "genre"
    t.integer  "brand_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
  end

  add_index "categories", ["brand_id"], :name => "index_categories_on_brand_id"

  create_table "categories_products", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "category_id"
  end

  add_index "categories_products", ["product_id", "category_id"], :name => "index_categories_products_on_product_id_and_category_id"

  create_table "images", :force => true do |t|
    t.integer  "product_id"
    t.string   "image_path"
    t.string   "thumb_path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "images", ["product_id"], :name => "index_images_on_product_id"

  create_table "initiatives", :force => true do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "slug"
    t.text     "about"
    t.string   "thumbnail"
    t.text     "splash"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "initiatives", ["brand_id"], :name => "index_initiatives_on_brand_id"

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "brand_id"
    t.boolean  "is_deleted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["brand_id"], :name => "index_messages_on_brand_id"

  create_table "messages_users", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.boolean  "is_read"
    t.boolean  "is_deleted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages_users", ["message_id"], :name => "index_messages_users_on_message_id"
  add_index "messages_users", ["user_id"], :name => "index_messages_users_on_user_id"

  create_table "products", :force => true do |t|
    t.integer  "brand_id"
    t.string   "prod_id"
    t.string   "name"
    t.string   "color"
    t.float    "price"
    t.text     "description"
    t.string   "genre"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "products", ["brand_id"], :name => "index_products_on_brand_id"

  create_table "products_users", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "products_users", ["product_id"], :name => "index_products_users_on_product_id"
  add_index "products_users", ["user_id"], :name => "index_products_users_on_user_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gendre"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "replies", :force => true do |t|
    t.text     "content"
    t.integer  "message_id"
    t.boolean  "is_read"
    t.boolean  "is_deleted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "replies", ["message_id"], :name => "index_replies_on_message_id"

  create_table "tracks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "brand_id"
    t.string   "page_url"
    t.string   "ip_address"
    t.datetime "visited_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tracks", ["brand_id"], :name => "index_tracks_on_brand_id"
  add_index "tracks", ["user_id"], :name => "index_tracks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "kind"
    t.string   "facebook_auth_id"
    t.string   "twitter_auth_id"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.datetime "updated_at",       :null => false
    t.string   "auth_hash"
    t.datetime "created_at",       :null => false
  end

end

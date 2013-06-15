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

ActiveRecord::Schema.define(:version => 20130530203311) do

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

  create_table "brands", :force => true do |t|
    t.intger   "user_id"
    t.string   "name"
    t.string   "slug"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  add_index "brands", ["user_id"], :name => "index_brands_on_user_id"

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

  create_table "products", :force => true do |t|
    t.integer  "brand_id"
    t.string   "prod_id"
    t.string   "name"
    t.string   "color"
    t.float   "price"
    t.text     "description"
    t.string   "genre"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "products", ["brand_id"], :name => "index_products_on_brand_id"
  
  create_table :categories_products, :id => false do |t|
      t.references :product
      t.references :category
  end
  add_index :categories_products, [:product_id, :category_id]

end

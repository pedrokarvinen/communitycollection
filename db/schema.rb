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

ActiveRecord::Schema.define(:version => 20130523085246) do

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
    t.string   "name"
    t.string   "slug"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

end

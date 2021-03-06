# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090608124028) do

  create_table "articles", :force => true do |t|
    t.integer  "source_id"
    t.string   "guid"
    t.string   "title"
    t.string   "link"
    t.datetime "pub_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["guid"], :name => "index_articles_on_guid", :unique => true

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "feed_url"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "article_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

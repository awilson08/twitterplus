class CreateDatabase < ActiveRecord::Migration
  def up
  create_table "Collections", :primary_key => "collectionID", :force => true do |t|
    t.string "username", :limit => 25
    t.string "name",     :limit => 25
  end

  add_index "Collections", ["username"], :name => "username"

  create_table "Follows", :id => false, :force => true do |t|
    t.string "username", :limit => 25, :default => "", :null => false
    t.string "iFollow",  :limit => 25, :default => "", :null => false
  end

  add_index "Follows", ["iFollow"], :name => "iFollow"

  create_table "HashTags", :primary_key => "text", :force => true do |t|
  end

  create_table "Likes", :id => false, :force => true do |t|
    t.string  "username",  :limit => 25, :default => "", :null => false
    t.integer "Tweets_ID",               :default => 0,  :null => false
    t.integer "likes",                   :default => 0,  :null => false
  end

  add_index "Likes", ["Tweets_ID"], :name => "Tweets_ID"

  create_table "List_Users", :id => false, :force => true do |t|
    t.integer "Lists_listID"
    t.string  "Users_username", :limit => 25
  end

  add_index "List_Users", ["Lists_listID"], :name => "Lists_listID"
  add_index "List_Users", ["Users_username"], :name => "Users_username"

  create_table "Lists", :primary_key => "listID", :force => true do |t|
    t.string "listName", :limit => 50
  end

  create_table "MadeOf", :primary_key => "collectionID", :force => true do |t|
    t.integer "Tweets_ID"
  end

  add_index "MadeOf", ["Tweets_ID"], :name => "Tweets_ID"

  create_table "Tweets", :primary_key => "ID", :force => true do |t|
    t.string    "username",       :limit => 25
    t.string    "text",           :limit => 140
    t.timestamp "timeStamp",                     :null => false
    t.boolean   "privacySetting"
    t.boolean   "retweet"
  end

  add_index "Tweets", ["username"], :name => "username"

  create_table "Users", :primary_key => "username", :force => true do |t|
    t.string "name",            :limit => 30
    t.string "password_digest"
    t.string "emailaddress",    :limit => 50
    t.string "biography",       :limit => 140
    t.string "picture",         :limit => 140
  end
  end

  def down
  	drop_table "Collections","Follows", "HashTags", "Likes", "List_Users", "MadeOf", "Tweets", "Users", "Lists"
  end
end

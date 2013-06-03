class Hashtag < ActiveRecord::Base
  set_table_name "HashTags"
  set_primary_key :text
end

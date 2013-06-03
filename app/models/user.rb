class User < ActiveRecord::Base
  set_table_name "Users"
  set_primary_key :username
end

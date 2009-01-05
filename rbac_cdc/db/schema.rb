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

ActiveRecord::Schema.define(:version => 20081230025735) do

  create_table "open_titles", :force => true do |t|
    t.string   "学号"
    t.string   "姓名"
    t.string   "论文题目"
    t.datetime "入学日期"
    t.string   "所在学院"
    t.string   "导师"
    t.boolean  "是否通过"
  end

  create_table "portals", :force => true do |t|
  end

  create_table "roles", :force => true do |t|
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "identifier", :limit => 100, :null => false
  end

  add_index "roles", ["identifier"], :name => "index_roles_on_identifier"

  create_table "roles_static_permissions", :id => false, :force => true do |t|
    t.integer "role_id",              :null => false
    t.integer "static_permission_id", :null => false
  end

  add_index "roles_static_permissions", ["role_id", "static_permission_id"], :name => "by_branch_party", :unique => true

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id", :unique => true

  create_table "sel_tutors", :force => true do |t|
    t.string   "学号"
    t.string   "姓名"
    t.string   "籍贯"
    t.datetime "出生日期"
    t.datetime "入学日期"
    t.string   "所在学院"
    t.text     "通讯地址"
    t.string   "导师"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "static_permissions", :force => true do |t|
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "identifier", :limit => 100, :null => false
    t.string   "url"
    t.string   "code",                      :null => false
  end

  add_index "static_permissions", ["identifier"], :name => "index_static_permissions_on_identifier"

  create_table "users", :force => true do |t|
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "password",           :limit => 128, :null => false
    t.string   "password_salt",      :limit => 100, :null => false
    t.string   "password_hash_type", :limit => 10,  :null => false
    t.string   "login",                             :null => false
  end

end

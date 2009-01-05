class RemoveEmailColumnUsers < ActiveRecord::Migration
  def self.up
  	remove_column :users, "email"
  end

  def self.down
  	remove_column :users, "email", :string,    :limit => 100, :null => false
  end
end

class AddUrlCodePermission < ActiveRecord::Migration
  def self.up
  	add_column :static_permissions, 'url', :string, :null => true 
  	add_column :static_permissions, 'code', :string, :null => false
  end

  def self.down
  	remove_column :static_permissions , 'url'
  	remove_column :static_permissions, 'code'
  end
end

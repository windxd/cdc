class CreatePortals < ActiveRecord::Migration
  def self.up
    create_table :portals do |t|
    end
  end

  def self.down
    drop_table :portals
  end
end

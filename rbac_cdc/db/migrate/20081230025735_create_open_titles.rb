class CreateOpenTitles < ActiveRecord::Migration
  def self.up
    create_table :open_titles do |t|
    	t.column "学号", :string
    	t.column "姓名", :string
    	t.column "论文题目", :string
    	t.column "入学日期", :datetime
    	t.column "所在学院", :string
    	t.column "导师", :string
    	t.column "是否通过", :bool
    	
    end
  end

  def self.down
    drop_table :open_titles
  end
end

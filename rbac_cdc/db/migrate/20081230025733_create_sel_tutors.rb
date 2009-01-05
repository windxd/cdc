class CreateSelTutors < ActiveRecord::Migration
  def self.up
    create_table :sel_tutors do |t|
    	t.column "学号", :string
    	t.column "姓名", :string
    	t.column "籍贯", :string
    	t.column "出生日期", :datetime
    	t.column "入学日期", :datetime
    	t.column "所在学院", :string
    	t.column "通讯地址", :text
    	t.column "导师", :string
    	
    end
  end

  def self.down
    drop_table :sel_tutors
  end
end

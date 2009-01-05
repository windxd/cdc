class Portal < ActiveRecord::Base
	CHOOSEROLES = [
		# Displayed					stored in db
		[ "管理员" ,		"m"	],
		[ "二级单位" ,		"d" ],
		[ "教 师" , 		"t" ],
		[ "学 生" , 		"s" ]
	]
	
end

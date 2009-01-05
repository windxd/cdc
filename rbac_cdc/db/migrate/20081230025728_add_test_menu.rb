class AddTestMenu < ActiveRecord::Migration
  def self.up
  	
  	StaticPermission.delete_all
  	  	
  	StaticPermission.create( :identifier => '招生管理', :url => '', :code => 'A')
	StaticPermission.create( :identifier => '招生工作管理', :url => '', :code => 'A1')
	StaticPermission.create( :identifier => '招生计划', :url => 'zhaoshengjihua/queryframe.htm', :code => 'A11')
	StaticPermission.create( :identifier => '招生计划查询', :url => 'xinshengguanli/queryframe.htm', :code => 'A12')
	StaticPermission.create( :identifier => '招生专业介绍查询', :url => 'zhuanyejieshao/queryframe.htm', :code => 'A13')
	StaticPermission.create( :identifier => '单位信息发布', :url => 'zhuanyejieshao/pbframe.htm', :code => 'A14')
	StaticPermission.create( :identifier => '复试小组申请', :url => 'zhaokaoguanli/fsframe.htm', :code => 'A15')
	StaticPermission.create( :identifier => '复试管理', :url => 'zhaokaoguanli/fsframe.htm', :code => 'A16')
	StaticPermission.create( :identifier => '调剂管理', :url => 'zhaokaoguanli/fsframe.htm', :code => 'A17')
	StaticPermission.create( :identifier => '录取情况查询', :url => 'luquchaxun/frame.htm', :code => 'A18')
	StaticPermission.create( :identifier => '新生数据', :url => 'xinshengguanli/queryframe.htm', :code => 'A19')
	StaticPermission.create( :identifier => '新生数据查询', :url => 'xinshengguanli/queryframe.htm', :code => 'A1A')
	
	StaticPermission.create( :identifier => '导入新生数据', :url => 'shujuqianyi/frame.htm', :code => 'A1B')
	StaticPermission.create( :identifier => '录取情况查询', :url => 'luquchaxun/frame.htm', :code => 'A1C')
	StaticPermission.create( :identifier => '新生数据管理', :url => 'xinshengguanli/frame.htm', :code => 'A1D')
	
	StaticPermission.create( :identifier => '招生计划管理', :url => '', :code => 'A1E')
	StaticPermission.create( :identifier => '招生计划列表', :url => 'zhaoshengjihua/frame.htm', :code => 'A1E1')
	StaticPermission.create( :identifier => '导师遴选', :url => 'zhaoshengjihua/frame.htm', :code => 'A1E2')
	StaticPermission.create( :identifier => '汇总招生计划', :url => 'zhaoshengjihua/statframe.htm', :code => 'A1E3')
	StaticPermission.create( :identifier => '发布招生计划', :url => 'zhaoshengjihua/pbframe.htm', :code => 'A1E4')
	
	StaticPermission.create( :identifier => '招生专业介绍管理', :url => '', :code => 'A1F')
	StaticPermission.create( :identifier => '专业介绍列表', :url => 'zhuanyejieshao/frame.htm', :code => 'A1F1')
	StaticPermission.create( :identifier => '发布专业介绍', :url => 'zhuanyejieshao/pbframe.htm', :code => 'A1F2')
	
	StaticPermission.create( :identifier => '初试管理', :url => '', :code => 'A1G')
	StaticPermission.create( :identifier => '考场安排', :url => '../jiaowu/kaowuguanli/kaowuxinxiguanli/frame.htm', :code => 'A1G1')
	StaticPermission.create( :identifier => '成绩管理', :url => 'shujuqianyi/frame.htm', :code => 'A1G2')
	StaticPermission.create( :identifier => '初试管理', :url => 'zhaokaoguanli/csframe.htm', :code => 'A1G3')
	
	StaticPermission.create( :identifier => '复试管理', :url => '', :code => 'A1H')
	StaticPermission.create( :identifier => '复试管理', :url => 'zhaokaoguanli/fsframe.htm', :code => 'A1H1')
	StaticPermission.create( :identifier => '复试小组管理', :url => 'zhaokaoguanli/fsframe.htm', :code => 'A1H2')
	StaticPermission.create( :identifier => '复试小组统计分析', :url => 'zhaokaoguanli/fsframe.htm', :code => 'A1H3')
	
	StaticPermission.create( :identifier => '录取管理', :url => '', :code => 'A1I')
	StaticPermission.create( :identifier => '调剂管理', :url => 'zhaokaoguanli/fsframe.htm', :code => 'A1I1')
	StaticPermission.create( :identifier => '政审调档管理', :url => 'zhaokaoguanli/zsframe.htm', :code => 'A1I2')
	
	
	StaticPermission.create( :identifier => '统计分析管理', :url => '', :code => 'A1J')
	StaticPermission.create( :identifier => '新生名册', :url => 'tongji/mcframe.htm', :code => 'A1J1')
	StaticPermission.create( :identifier => '招生计划统计', :url => 'tongji/planframe.htm', :code => 'A1J2')
	StaticPermission.create( :identifier => '录取情况统计', :url => 'tongji/lqframe.htm', :code => 'A1J3')
	
	StaticPermission.create( :identifier => '数据转移', :url => 'shujudaochu/frame.htm', :code => 'A1K')
	
	StaticPermission.create( :identifier => '教学管理', :url => '', :code => 'B')
	
	StaticPermission.create( :identifier => '排课管理', :url => '', :code => 'B1')
	StaticPermission.create( :identifier => '教材信息管理', :url => 'xi_tong_xin_xi_guang_li/zhuan_ye_xin_xi/zyxx-frame.htm', :code => 'B11')
	StaticPermission.create( :identifier => '排课结果管理', :url => 'xi_tong_xin_xi_guang_li/kai_ke_ke_cheng_xin_xi/kkccxx-frame.htm', :code => 'B12')
	
	StaticPermission.create( :identifier => '选课管理', :url => '', :code => 'B2')
	StaticPermission.create( :identifier => '选课数据初始化', :url => 'xuan_ke_xi_tong/xuan_ke_su_ju/frame.htm', :code => 'B21')
	StaticPermission.create( :identifier => '选课数据调整', :url => 'xuan_ke_xi_tong/xuan_ke_su_ju_tiao_zhen/frame.htm', :code => 'B22')
	StaticPermission.create( :identifier => '选修课', :url => 'xuan_ke_xi_tong/ke_chen_xuan_zhe2/frame1.htm', :code => 'B23')
	StaticPermission.create( :identifier => '学生课表', :url => 'xuan_ke_xi_tong/xie_sheng_ke_biao/frame.htm', :code => 'B24')
	
	StaticPermission.create( :identifier => '考务管理', :url => '', :code => 'B3')
	StaticPermission.create( :identifier => '考场库管理', :url => 'kaowuguanli/kaochangkuguanli/frame.htm', :code => 'B31')
	StaticPermission.create( :identifier => '监考信息库管理', :url => 'kaowuguanli/jiankaoxinxikuguanli/frame.htm', :code => 'B32')
	StaticPermission.create( :identifier => '考务信息管理', :url => 'kaowuguanli/kaowuxinxiguanli/frame.htm', :code => 'B33')
	
	StaticPermission.create( :identifier => '成绩管理', :url => '', :code => 'B4')
	StaticPermission.create( :identifier => '成绩管理', :url => 'scoremng/jwc_scoremng_frame.htm', :code => 'B41')
	
	StaticPermission.create( :identifier => '选课系统', :url => '', :code => 'B5')
	StaticPermission.create( :identifier => '查看选课名单', :url => 'xuan_ke_xi_tong/xuan_ke_jie_guo_teacher/frame.htm', :code => 'B51')
	
	StaticPermission.create( :identifier => '成绩系统', :url => '', :code => 'B6')
	StaticPermission.create( :identifier => '成绩管理', :url => 'scoremng/tch_scoremng_frame.htm', :code => 'B61')
	
	StaticPermission.create( :identifier => '考试安排', :url => '', :code => 'B7')
	StaticPermission.create( :identifier => '考试安排', :url => 'xuan_ke_xi_tong/xie_sheng_ke_biao/frame.htm', :code => 'B71')
	
	StaticPermission.create( :identifier => '成绩管理', :url => '', :code => 'B8')
	StaticPermission.create( :identifier => '成绩查询', :url => 'scoremng/std_score_frame.htm', :code => 'B81')

  end

  def self.down
  	StaticPermission.delete_all
  end
end

class GetmenuinfoController < ApplicationController
	
	def login
		@all_menus = StaticPermission.find_by_sql "select * from static_permissions where code like '_' order by id"
		
		@hash_menu = {}
		
		@hash_menu["请选择部门"]=-1
		for menu in @all_menus
			
			@hash_menu[menu.identifier] = menu.id
		end						
	end
	
	def get_role							
		if params[:id]=="-1"
			@hash_role = {}
			render :partial => "roles"	
			
		else
			@permission = StaticPermission.find(params[:id])
			logger.info(@permission)
			@roles = @permission.roles
			
			@hash_role = {}		
			for role in @roles
				
				@hash_role[role.identifier] = role.id
			end	
			render :partial => "roles"	
		end		
	end
	
	def user_login
		  @user = User.new()
    	  @user.login = params[:user][:login]
    	  @user.password = params[:user][:password]
    	  
    	  role_user = params[:user][:role]
    	  @menu_user = params[:user][:menu]
    	  
    	  if role_user == nil || @menu_user == nil
    	  		flash[:notice] = "please choose partment and roles!!"
	    	  	
	    	  	redirect_to :action => :login
	      else
		      	#@users = User.find_by_login(@user.login)    	  
	    	  @usr = User.find_by_credentials( @user.login, @user.password )
	    	  
	    	  if @usr.nil? then 
	    	  	flash[:notice] = "user name and pass are error!"
	    	  	
	    	  	redirect_to :action => :login
		  	  else
		  	  	
		  	  	@roles = @usr.roles	  	  	
		  	  	@role = Role.find( role_user)
		  	  	
		  	  	#判断角色是否存在
		  	  	if @roles.include? @role then 
			  	  	@perm = StaticPermission.find(@menu_user)
			  	  	@permissions = @role.static_permissions
		  	    else
		  	    	flash[:notice] = "user's role not existed!"    	  	
	    	  	    redirect_to :action => :login
	  	    	end  	    	
	  	      end    	  	
      	  end
		 
    	        	         	      	      	  
	end
end

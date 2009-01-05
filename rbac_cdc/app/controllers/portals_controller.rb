require 'will_paginate' 
class PortalsController < ApplicationController
  def index
    list       
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @portals = Portal.paginate :page => params[:page], :per_page => 10 #每页十条  
        
    #windxd添加用来得到部门列表
    @all_menus = StaticPermission.find_by_sql "select * from static_permissions where code like '_' order by id"
		
	@hash_menu = {}
	
	@hash_menu["请选择部门"]=-1
	for menu in @all_menus
		
		@hash_menu[menu.identifier] = menu.id
	end		
    #windxd
  end
  
  #用来得到相应部门下的角色列表windxd------
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

  def show
    @portal = Portal.find(params[:id])
  end

  def new
    @portal = Portal.new
  end
  
  def login
	@portal = Portal.new
	redirect_to :action => :index
  end

  def create
    @portal = Portal.new(params[:portal])
    if @portal.save
      flash[:notice] = 'Portal was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @portal = Portal.find(params[:id])
  end

  def update
    @portal = Portal.find(params[:id])
    if @portal.update_attributes(params[:portal])
      flash[:notice] = 'Portal was successfully updated.'
      redirect_to :action => 'show', :id => @portal
    else
      render :action => 'edit'
    end
  end

  def destroy
    Portal.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end

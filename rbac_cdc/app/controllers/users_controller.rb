require 'will_paginate' 
class UsersController < ApplicationController
	
  #放入访问控制
  before_filter :authorize, :except => :admin_login
  
  def authorize
  	unless session[:admin_id]
  		flash[:notice] = "please login!!"
    	  	
    	redirect_to :action => :admin_login
  	end  	
  end
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @users = User.paginate :page => params[:page], :per_page => 10 #每页十条  
  end

  def show
    @user = User.find(params[:id])
  end

  #admin 管理员登陆进来，进行管理权限用的action
  #author:刁现峰
  #date: 2008-12-23
  def admin_login  	
  	
  	if request.get?
  		#请求登陆页页
  		render :partial => "admin_login"
  		session[:admin_id] = nil
  	else
  		#进行登录验证
  		  @user = User.new
    	  @user.login = params[:user][:login]
    	  @user.password = params[:user][:password]
    	      	      	    
    	  @usr = User.find_by_credentials( @user.login, @user.password )
    	  
    	  if @usr.nil? then 
    	  	flash[:notice] = "user name and pass are error!"
    	  	
    	  	redirect_to :action => :admin_login
	  	  else
	  	  	
	  	  	@roles = @usr.roles	  	  	
	  	  		  	  		  	  	
	  	  	#判断角色是否存在
	  	  	if @roles.include? Role.find_by_identifier('admin') then 
	  	  		flash[:notice] = "admin login success!"	  	  		
	  	  		
	  	  		session[:admin_id] = @usr.id
		  	  	redirect_to :action => :list
	  	    else
	  	    	flash[:notice] = "user name and pass are error!"
    	  	
    	  		redirect_to :action => :admin_login
    	  	    
  	    	end  	    	
  	      end    	  	      	         	      	      	
  		
  	end
  	  	
  end    
  #--------------------end---------------------------

  def new
    @user = User.new
    @role = Role.find(:all)
  end

  def create
  	@role = Role.find(:all)
  	
  	logger.info { params[:user] }
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    logger.info { "-=-=-=-=-=-=-=-=-=-=-=user#{@user.password}" }
    if @user.save
    	
	  params[:user][:roles] = [] if params[:user][:roles].nil?    
      @user.roles = params[:user][:roles].collect { |i| Role.find(i) }      
      
      flash[:notice] = 'User was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @role = Role.find(:all)
  end

  def update
    @user = User.find(params[:id])
    
	unless params[:password].to_s == ""
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
    end  
    
    logger.info("******************_________________________*********************")
    logger.info(@user)
    logger.info("******************_________________________*********************")
    
    if @user.update_attributes(params[:user])
      params[:user][:roles] = [] if params[:user][:roles].nil?    
      @user.roles = params[:user][:roles].collect { |i| Role.find(i) }   	
    	
      flash[:notice] = 'User was successfully updated.'
      redirect_to :action => 'show', :id => @user
    else
      @role = Role.find(:all)
      render :action => 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end

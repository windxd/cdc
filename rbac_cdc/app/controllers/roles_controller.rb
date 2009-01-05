require 'will_paginate' 
#分页要加上的

class RolesController < ApplicationController
  before_filter :authorize
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    #@role_pages, @roles = Role.paginate :page => params[:page], :per_page => 2 #每页两条  
    @roles = Role.paginate :page => params[:page], :per_page => 10 #每页两条  
  end

  def show
    @role = Role.find(params[:id])
    @permissions = StaticPermission.find(:all)
  end

  def new
    @role = Role.new    
    @permissions = StaticPermission.find(:all)   
  end

  def create
    @role = Role.new(params[:role])
    
    # get an array of static permissions and set the permission associations
      params[:role][:static_permissions] = [] if params[:role][:static_permissions].nil?
      permissions = params[:role][:static_permissions].collect { |i| StaticPermission.find(i) }
      @role.static_permissions = permissions
      
    if @role.save
      flash[:notice] = 'Role was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @role = Role.find(params[:id])
    
    @permissions = StaticPermission.find(:all)
  end

  def update
     @role = Role.find(params[:id])
    
    # get an array of static permissions and set the permission associations
      params[:role][:static_permissions] = [] if params[:role][:static_permissions].nil?
      permissions = params[:role][:static_permissions].collect { |i| StaticPermission.find(i) }
      @role.static_permissions = permissions
      
    if @role.update_attributes(params[:role])
      flash[:notice] = 'Role was successfully updated.'
      redirect_to :action => 'show', :id => @role
    else
      render :action => 'edit'
    end
  end

  def destroy
    Role.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end

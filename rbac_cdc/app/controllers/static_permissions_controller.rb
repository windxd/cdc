require 'will_paginate' 
class StaticPermissionsController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @static_permissions = StaticPermission.paginate :page => params[:page], :per_page => 10 #每页十条  
  end

  def show
    @static_permission = StaticPermission.find(params[:id])
  end

  def new
    @static_permission = StaticPermission.new
  end

  def create
    @static_permission = StaticPermission.new(params[:static_permission])
    if @static_permission.save
      flash[:notice] = 'StaticPermission was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @static_permission = StaticPermission.find(params[:id])
  end

  def update
    @static_permission = StaticPermission.find(params[:id])
    if @static_permission.update_attributes(params[:static_permission])
      flash[:notice] = 'StaticPermission was successfully updated.'
      redirect_to :action => 'show', :id => @static_permission
    else
      render :action => 'edit'
    end
  end

  def destroy
    StaticPermission.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end

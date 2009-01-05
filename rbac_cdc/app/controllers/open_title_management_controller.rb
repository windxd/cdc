require 'will_paginate' 
class OpenTitleManagementController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @open_titles = OpenTitleManagement.paginate :page => params[:page], :per_page => 10 #每页十条  
  end

  def show
    @open_title = OpenTitle.find(params[:id])
  end

  def new
    @open_title = OpenTitle.new
  end

  def create
    @open_title = OpenTitle.new(params[:open_title])
    if @open_title.save
      flash[:notice] = 'OpenTitle was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @open_title = OpenTitle.find(params[:id])
  end

  def update
    @open_title = OpenTitle.find(params[:id])
    if @open_title.update_attributes(params[:open_title])
      flash[:notice] = 'OpenTitle was successfully updated.'
      redirect_to :action => 'show', :id => @open_title
    else
      render :action => 'edit'
    end
  end

  def destroy
    OpenTitle.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end

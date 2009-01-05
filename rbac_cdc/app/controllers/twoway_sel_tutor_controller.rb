require 'will_paginate' 
class TwowaySelTutorController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
   @sel_tutors = TwowaySelTutor.paginate :page => params[:page], :per_page => 10 #每页十条  
  end

  def show
    @sel_tutor = SelTutor.find(params[:id])
  end

  def new
    @sel_tutor = SelTutor.new
  end

  def create
    @sel_tutor = SelTutor.new(params[:sel_tutor])
    if @sel_tutor.save
      flash[:notice] = 'SelTutor was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @sel_tutor = SelTutor.find(params[:id])
  end

  def update
    @sel_tutor = SelTutor.find(params[:id])
    if @sel_tutor.update_attributes(params[:sel_tutor])
      flash[:notice] = 'SelTutor was successfully updated.'
      redirect_to :action => 'show', :id => @sel_tutor
    else
      render :action => 'edit'
    end
  end

  def destroy
    SelTutor.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  def show_time

  @time = Time.now.year.to_s + "-" + Time.now.month.to_s + "-" + Time.now.day.to_s

end

end

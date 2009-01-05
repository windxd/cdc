# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require_dependency 'user'
require_dependency 'role'
require_dependency 'static_permission'

class ApplicationController < ActionController::Base
   acts_as_anonymous_user :anonymous_user => AnonymousUser
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_rbac5_session_id'
  
  #Danny Qiu
  session :session_key => '_xycdc_session_id'
  
  acts_as_current_user_container :anonymous_user => :anonymous_user

  #放入访问控制
 
  private 
  def authorize
  	unless session[:admin_id]
  		flash[:notice] = "please login!!"
    	  	
    	redirect_to :action => :admin_login
  	end  	
  end
end

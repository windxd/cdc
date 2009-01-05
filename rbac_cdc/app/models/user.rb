class User < ActiveRecord::Base 
	
	
  validates_presence_of :login
  validates_uniqueness_of :login
  
  acts_as_user
  acts_as_encrypts_password

    class << self
    # Searches for the user record with the given email and password and
    # returns a User instance for it. Returns nil if no user with the given
    # credentials could be found.
	    def find_by_credentials(login, password)
	      user = User.find(:first, :conditions => [ 'login = ?', login ])
	
	      if not user.nil? and user.password_equals?(password) then
	        user
	      else
	        nil
	      end
	    end
    end
end

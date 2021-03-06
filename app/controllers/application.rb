# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '402c4e735a0eec72655926b641f1c693'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
before_filter :authorize, :except => [:login,:create_user,:check_user,:create]
    protected
    def authorize
      #raise session[:user_id].inspect
      unless User.find_by_id(session[:user_id])
        flash[:notice] = "Please log in"
        redirect_to :controller => 'login' , :action => 'login'
      end
    end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def current_user
      return session[:user]
    end 
end

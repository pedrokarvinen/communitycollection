class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def current_user
      return session[:user]
    end 
    
    def signed_in_user
      if current_user.nil?
        return false
      else
        if current_user.kind =='user'
          return true
        else
          return false
        end
      end
    end
    
    def signed_in_brand
      if current_user.nil?
        return false
      else
        if current_user.kind =='brand'
          return true
        else
          return false
        end
      end
    end
end

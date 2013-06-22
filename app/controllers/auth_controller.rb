class AuthController < ApplicationController
  layout "auth"
  
  public
  def index
    
  end
  
  def signin
    if current_user.nil?
      logger.info(session[:stay_signed_in])
      if session[:stay_signed_in].nil? or session[:stay_signed_in] == '0'
        @stay_signed_in = 0
        @email = ''
        @password = ''
      else
        @stay_signed_in = 1
        @email = session[:email]
        @password = session[:password]
      end


    else
      if current_user.kind =='brand'
        redirect_to '/backend'
      else
        redirect_to '/shop'
      end
    end
  end
  
  def do_login
    email = params[:email]
    password = params[:password]
    is_stay = params[:is_stay]
    
    
    
    user = Users.where(:email => email, :password => password, :is_active => true, :is_deleted => false)

    msg = {}
    if user.count == 1
      session[:user] = user.first
      msg[:status] = 'success'
      msg[:message] = 'Signed in successfully!'
      
      session[:stay_signed_in] = is_stay
      
      if is_stay == '1'
        session[:email] = email
        session[:password] = password
      end
      
      if user.first.kind == 'brand'
        msg[:redirect_url] = '/backend'
      else
        msg[:redirect_url] = '/shop'
      end
    else
      msg[:status] = 'fail'
      msg[:message] = 'Wrong email or password!'
    end
    
    respond_to do |format|
      format.json  { render :json => msg }
    end
  end
  
  def do_logout
    session[:user] = nil
    redirect_to '/'
  end
end

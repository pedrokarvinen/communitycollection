class BackendController < ApplicationController
  layout "backend"
  
  def index
    if signed_in_brand == false
      redirect_to '/'
    end       
  end
  
  def dashboard
    if signed_in_brand == false
      redirect_to '/'
    end
  end
  
  def community
    if signed_in_brand == false
      redirect_to '/'
    end
  end
  
  def message
    if signed_in_brand == false
      redirect_to '/'
    end
  end
  
end

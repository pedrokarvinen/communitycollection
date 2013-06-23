class UserController < ApplicationController
  def index
    
  end
  
  def add_wishlist
    msg = {}
    
    if signed_in_user
      if ProductsUsers.where('user_id'=>current_user.id, 'product_id'=>params[:product_id]).count == 0
        pu = ProductsUsers.new()
        pu.product_id = params[:product_id]
        pu.user_id = current_user.id
        
        if pu.save
          msg[:status] = 'success'
          msg[:message] = 'You added this products in your wish list successfully!'
        else
          msg[:status] = 'fail'
          msg[:message] = 'Fails in adding the product in your wish list!'
        end
      else
        msg[:status] = 'success'
        msg[:message] = 'This product is already in your wish list!'
      end
    else
      msg[:status] = 'fail'
      msg[:message] = 'Please sign in as a user!'
    end
    
    respond_to do |format|
      format.json  { render :json => msg }
    end
  end
  
  def visit_page
  
    msg = {}
    
    if signed_in_user
      track = Tracks.new()
      track.brand_id = params[:brand_id]
      track.user_id = current_user.id
      track.visited_at = DateTime.now()
      track.page_url = params[:page_url]
      track.ip_address = request.remote_ip
      
      if track.save
        msg[:status] = 'success'
        #msg[:message] = 'You added this products in your wish list successfully!'
      else
        msg[:status] = 'fail'
        #msg[:message] = 'Fails in adding the product in your wish list!'
      end
    end
    
    respond_to do |format|
      format.json  { render :json => msg }
    end
  end
end

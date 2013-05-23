class ShopController < ApplicationController
  def index
    @brands = Brand.all
  end
  
  def brands
    
  end
end

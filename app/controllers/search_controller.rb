class SearchController < ApplicationController
  def index
    @products = Product.order('random()').limit(5)
  end
  
  def products
    @products = Product.order('random()').all
  end
  
  def initiatives
  end
  
  def brands

  end
end

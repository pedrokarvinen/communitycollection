class SearchController < ApplicationController
  def index
    #@products = Product.order('random()').limit(5)
  end
  
  def products
    if params[:keyword].nil?
      @keyword = ''
    else
      @keyword = params[:keyword]
    end
  end
  
  def initiatives
  end
  
  def search_all
    keyword = params[:keyword]
    @result = {}
    @result[:products] = Product.where("name ilike '%#{keyword}%'").order('random()').limit(5)
    @result[:products_count] = Product.where("name ilike '%#{keyword}%'").count
    
    @result[:brands] = Brand.where("name ilike '%#{keyword}%'").order('random()').limit(5)
    @result[:brands_count] = Brand.where("name ilike '%#{keyword}%'").count
      
    @result[:initiatives] = Initiative.where("name ilike '%#{keyword}%'").order('random()').limit(5)
    @result[:initiatives_count] = Initiative.where("name ilike '%#{keyword}%'").count
    render :partial => 'search/result_all', :object => @result 
  end
  
  def search_products
    keyword = params[:keyword]
    @result = {}
    @result[:products] = Product.where("name ilike '%#{keyword}%'").order('random()')
    @result[:products_count] = Product.where("name ilike '%#{keyword}%'").count
    render :partial => 'search/result_products', :object => @result
  end
  
  def search_initiatives
    
  end
  
  def search_brands
    
  end
end

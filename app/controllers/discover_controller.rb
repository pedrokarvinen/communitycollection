class DiscoverController < ApplicationController
  def index
    
  end
  
  def bybrand
    
  end
  
  def byinitiative
    
  end
  
  def brand
    @brand = Brand.find(:first, :conditions => "slug = '#{params[:brand]}'")
  end
  
  def initiative
    @brand = Brand.find(:first, :conditions => "slug = '#{params[:brand]}'")
    @initiative = Initiative.find(:first, :conditions => "slug = '#{params[:initiative]}'")
  end
  
  def article
    @brand = Brand.find(:first, :conditions => "slug = '#{params[:brand]}'")
    @initiative = Initiative.find(:first, :conditions => "slug = '#{params[:initiative]}'")
    @article = Article.find(:first, :conditions => "slug = '#{params[:article]}'")
  end
end

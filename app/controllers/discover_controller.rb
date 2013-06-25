class DiscoverController < ApplicationController
  def index
    
  end
  
  def bybrand
    
  end
  
  def byinitiative
    
  end
  
  def brand
        
    @brand = Brand.find(:first, :conditions => "slug = '#{params[:brand]}'")
    if not @brand
      redirect_to "/discover/by-brand"
    end
  end
  
  def initiative
    
    @brand = Brand.find(:first, :conditions => "slug = '#{params[:brand]}'")
    if not @brand
      redirect_to "/discover/by-brand"
    end
    
    @initiative = Initiative.find(:first, :conditions => "slug = '#{params[:initiative]}'")
    if not @initiative
      redirect_to "/discover/by-brand/" + params[:brand]
    end
    
  end
  
  def article
    @brand = Brand.find(:first, :conditions => "slug = '#{params[:brand]}'")
    if not @brand
      redirect_to "/discover/by-brand"
    end
    
    @initiative = Initiative.find(:first, :conditions => "slug = '#{params[:initiative]}'")
    if not @initiative
      redirect_to "/discover/by-brand/" + params[:brand]
    end
    
    @article = Article.find(:first, :conditions => "slug = '#{params[:article]}'")
    if not @article
      redirect_to "/discover/by-brand/" + params[:brand] + "/" + params[:initiative]
    end
  end
end

class DiscoverController < ApplicationController
  def index
    if current_user.nil?
      redirect_to '/'
    end
  end
  
  def bybrand
    if current_user.nil?
      redirect_to '/'
    end
  end
  
  def byinitiative
    if current_user.nil?
      redirect_to '/'
    end
  end
  
  def brand
    if current_user.nil?
      redirect_to '/'
    end
    
    @brand = Brand.find(:first, :conditions => "slug = '#{params[:brand]}'")
    if not @brand
      redirect_to "/discover/by-brand"
    end
  end
  
  def initiative
    if current_user.nil?
      redirect_to '/'
    end
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
    if current_user.nil?
      redirect_to '/'
    end
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

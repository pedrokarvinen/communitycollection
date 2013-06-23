class ShopController < ApplicationController
  def index
  
    if current_user.nil?
      redirect_to '/'
    end
    
    @brands = Brand.all
    if params[:brand]
      @brand_slug = params[:brand]
    else
      @brand_slug = 'levis'
    end
    
    if params[:genre]
      @genre = params[:genre]
    else
      @genre = 'all'
    end
    
    if params[:category]
      @category = params[:category]
    else
      @category = 'all'
    end
    
    @brand = Brand.find(:first, :conditions => "slug='#{@brand_slug}'")
    
    if @brand
      #getting product types
      @categories = Array.new()
      if @genre == "all"
        cats = Category.where("brand_id=#{@brand.id} and parent_id=0 and kind='category'").all
      else
        cats = Category.where("brand_id=#{@brand.id} and parent_id=0 and kind='category' and genre='#{@genre}'").all  
      end
      
      cats.each do |cat|
        cat_hash = Hash.new()
        cat_hash[:cat] = cat;
        cat_hash[:subcats] = Category.where('parent_id=?', cat.id).all
        @categories.push(cat_hash)
      end
      
      #getting collections
      @collections = Array.new()
      if @genre == "all"
        cols = Category.where("brand_id=#{@brand.id} and parent_id=0 and kind='collection'").all
      else
        cols = Category.where("brand_id=#{@brand.id} and parent_id=0 and kind='collection' and genre='#{@genre}'").all       
      end
      
      cols.each do |col|
        col_hash = Hash.new()
        col_hash[:col] = col;
        col_hash[:subcols] = Category.where('parent_id=?', col.id).all
        @collections.push(col_hash)
      end
      
      where = '1=1'
      if @genre != 'all'
        where += " AND products.genre='#{@genre}'"
      end
      
      if @category != 'all'
        where += " AND categories.id=#{@category}"
      end
      @products = Product.includes(:categories).where(where).order('random()').all
      
      

    end
  end
  
  def brands
    if current_user.nil?
      redirect_to '/'
    end
  end
end



class Admin::ScrapController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  layout "admin"
  before_filter :do_before_filter
  
  private 
  def do_before_filter
    @site_url = 'http://us.levi.com';
    @product_path = '/product/index.jsp';
    @family_path = '/family/index.jsp'
  end
  
  public
  def index
    redirect_to 'levis'
  end
  
  def levis
    if params[:family_url]
      
      
      
      family_url = params[:family_url]
      product_url = params[:product_url]
      brand_slug = params[:brand_slug]
      
      brand = Brand.find(:first, :conditions => "slug = '#{brand_slug}'")
      
      categories = brand.categories
      
      categories.each do |category|
        family_doc = Nokogiri::HTML(open(family_url + '?view=all&categoryId=' + category.cat_id))
        products = family_doc.css('ol.products .product')
        
        
        products.each do |p|
          prod_id = p.css('a.main-img').attr('href').text.gsub(@product_path + '?productId=', '').gsub('view=all', '').gsub('&', '')
          name = p.css('h3 a').text;
          color = p.css('a.colorName').text
          
          if p.css('a.price span.ours')
            price = p.css('a.price span.ours span').text.gsub(' $', '')
          else
            price = p.css('a.price span').text.gsub('$', '')    
          end
          
          #insert new product
          if product = Product.find(:first, :conditions => "prod_id='#{prod_id}'")
            product.categories.push(category)
            product.save            
          else
            product_doc = Nokogiri::HTML(open(product_url + '?productId=' + prod_id))
            description = product_doc.css('div#detailsSub2 p.product_description').text.gsub('<h3>Product Description</h3>', '');
            images = Array.new()
            
           
            #get the images and thumbs for the product
            product_doc.css('ul#more_views li a img').each do |img|
              image = Array.new()
              image.push(img.attr('data-main'), img.attr('src'));
              logger.info("image path:" + image[0])
              images.push(image)
            end
            
            prod_info = Hash.new()
            prod_info[:prod_id] = prod_id
            prod_info[:name] = name
            prod_info[:color] = color
            prod_info[:price] = price
            prod_info[:description] = description
            prod_info[:genre] = category['genre']
            
            product = Product.new(prod_info)
            product.brand = brand
            
            product.categories.push(category)
            
            if product.save
              
              images.each do |img|
                image = Image.new();
                image.product = product
                image.image_path = img[0]
                image.thumb_path = img[1]
                image.save
              end

            end
          end
        end 
      end      
  
    end
  end

end

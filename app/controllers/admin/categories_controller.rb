class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_filter :do_before_filter
  
  private 
  def do_before_filter
    @brand = Brand.find(params[:brand_id])
    @categories = @brand.categories
  end
  
  public
  def index
    
  end
  
  def new
    @category = Category.new
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(params[:category])
    @category.brand = @brand
    if @category.save
      flash[:success] = "The category was created correctly"
      redirect_to "/admin/brands/" + params[:brand_id] + "/categories"
    else
      flash[:success] = "Errors!"
      redirect_to "/admin/brands/" + params[:brand_id] + "/categories/new"
    end
  end
  
  def update
      @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        flash[:success] = "The category was updated correctly"
        redirect_to "/admin/brands/" + params[:brand_id] + "/categories"
      else
        flash[:error] = "Error!"
        redirect_to 'admin/brands/' + params[:brand_id] + "/categories/edit/" + params[:id] 
      end
  end
  
  def delete
    if category = Category.find(params[:id])
      if category.destroy
        flash[:success] = "The category deleted!"
      else
        flash[:error] = "The category could not be deleted"
      end
    end
    
    redirect_to '/admin/brands/' + params[:brand_id] + '/categories'
  end
end

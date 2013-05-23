class Admin::BrandsController < ApplicationController
  def index
    @brands = Brand.all
    render :layout => 'admin'
  end
  
  def new
    @brand = Brand.new
    render :layout => 'admin'
  end
  
  def edit
    @brand = Brand.find(params[:id])
    render :layout => 'admin'
  end
  
  def create
    @brand = Brand.new(params[:brand])
    if @brand.save
      flash[:success] = "The brand was created correctly"
      redirect_to "/admin/brands"
    else
      render :layout =>'admin/brands/new'
    end
  end
  
  def update
      @brand = Brand.find(params[:id])
      if @brand.update_attributes(params[:brand])
        flash[:success] = "The brand was updated correctly"
        redirect_to "/admin/brands"
      else
        flash[:error] = "Error!"
        redirect_to 'admin/brands/' + params[:id]
      end
  end
  
  def delete
    if brand = Brand.find(params[:id])
      if brand.destroy
        flash[:success] = "Brand deleted!"
      else
        flash[:error] = "Brand could not be deleted"
      end
    end
    
    redirect_to '/admin/brands'
  end
end

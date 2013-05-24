class Admin::InitiativesController < ApplicationController
  layout "admin"
  before_filter :do_before_filter
  
  private 
  def do_before_filter
    @brand = Brand.find(params[:brand_id])
  end
  
  public
  def index
    @initiatives = @brand.initiatives
  end
  
  def new
    @initiative = Initiative.new
  end
  
  def edit
    @initiative = Initiative.find(params[:id])
  end
  
  def create
    @initiative = Initiative.new(params[:initiative])
    @initiative.brand = @brand
    if @initiative.save
      flash[:success] = "The initiative was created correctly"
      redirect_to "/admin/brands/" + params[:brand_id] + "/initiatives"
    else
      flash[:success] = "Errors!"
      redirect_to "/admin/brands/" + params[:brand_id] + "/initiatives/new"
    end
  end
  
  def update
      @initiative = Initiative.find(params[:id])
      if @initiative.update_attributes(params[:initiative])
        flash[:success] = "The initiative was updated correctly"
        redirect_to "/admin/brands/" + params[:brand_id] + "/initiatives"
      else
        flash[:error] = "Error!"
        redirect_to 'admin/brands/' + params[:brand_id] + "/initiatives/edit/" + params[:id] 
      end
  end
  
  def delete
    if initiative = Initiative.find(params[:id])
      if initiative.destroy
        flash[:success] = "The initiative deleted!"
      else
        flash[:error] = "The initiative could not be deleted"
      end
    end
    
    redirect_to '/admin/brands/' + params[:brand_id] + '/initiatives'
  end
end

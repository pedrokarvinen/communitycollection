class Admin::ArticlesController < ApplicationController
  layout "admin"
  before_filter :do_before_filter
  
  private 
  def do_before_filter
    @brand = Brand.find(params[:brand_id])
    @initiative = Initiative.find(params[:initiative_id])
  end
  
  public
  def index
    @articles = @initiative.articles
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(params[:article])
    @article.initiative = @initiative
    if @article.save
      flash[:success] = "The article was created correctly"
      redirect_to "/admin/brands/" + params[:brand_id] + "/initiatives/" + params[:initiative_id] + "/articles"
    else
      flash[:success] = "Error in creating new article!"
      redirect_to "/admin/brands/" + params[:brand_id] + "/initiatives/" + params[:initiative_id] + "/articles/new"
    end
  end
  
  def update
      @article = Article.find(params[:id])
      if @article.update_attributes(params[:article])
        flash[:success] = "The article was updated correctly"
        redirect_to "/admin/brands/" + params[:brand_id] + "/initiatives/" + params[:initiative_id] + "/articles"
      else
        flash[:error] = "Error!"
        redirect_to 'admin/brands/' + params[:brand_id] + "/initiatives/" + params[:initiative_id] + "/articles/edit/" + params[:id] 
      end
  end
  
  def delete
    if article = Article.find(params[:id])
      if article.destroy
        flash[:success] = "The article deleted!"
      else
        flash[:error] = "The article could not be deleted!"
      end
    end
    
    redirect_to '/admin/brands/' + params[:brand_id] + '/initiatives/' + params[:initiative_id] + '/articles'
  end
end

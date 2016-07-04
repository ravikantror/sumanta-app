class ArticlesController < ApplicationController
  def index
    if params[:_method].present?
     @articles = current_user.articles
   else
     @articles = Article.all
  end
end
  def new
       @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
  @article = Article.find(params[:id])
  end
  
  def create
     @article =current_user.articles.new(article_params)
     @article.save
    @articles = Article.all
  end 
  
def update
  @article = Article.find(params[:id])
 @article.update(article_params)
  @articles = Article.all
end
 def destroy
    @article =Article.find(params[:id])
    @article.destroy
    @articles = Article.all
  end
  
  private
  def article_params
    params.require(:article).permit(:name , :user_id, :des,:post_type)
  end
end

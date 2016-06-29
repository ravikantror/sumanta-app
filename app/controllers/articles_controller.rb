class ArticlesController < ApplicationController
  def home
     @articles = current_user.articles
  end
  
  def index
       @articles = Article.all
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
     @article = current_user.articles.new(article_params)
     
    @article.save
    redirect_to show_form_path
  end 
  
def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

 def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:name , :user_id, :des)
  end
end

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
    if @article.save
    redirect_to @article
   else
    render 'new'
  end
  end 
  
def update
  @article = current_user.articles.find(params[:id])
 
  if @article.update(article_params)
    redirect_to article_path
  else
    render 'edit'
  end
end

 def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:name , :user_id, :des,:post_type)
  end
end

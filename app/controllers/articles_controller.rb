class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_parameters)
    if @article.save
      flash[:notice] = "Article succefully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_parameters)
      flash[:notice] = "Article successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article successfully deleted"
    redirect_to articles_path
  end

  private
  def article_parameters
    params.require(:article).permit(:title,:description)
  end
end
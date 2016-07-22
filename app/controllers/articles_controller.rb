class ArticlesController < ApplicationController

  before_action :set_article, only:[:edit, :show, :destroy, :update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_parameters)
    if @article.save
      flash[:success] = "Article succefully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @article.update(article_parameters)
      flash[:success] = "Article successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy

    @article.destroy
    flash[:danger] = "Article successfully deleted"
    redirect_to articles_path
  end

  private
  def article_parameters
    params.require(:article).permit(:title,:description)
  end

  private
  def set_article
     @article = Article.find(params[:id])
  end
end
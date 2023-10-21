class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:update, :destroy]

  def index
    @article = Article.all
  end
  def new
    @article = Article.new
  end

  def create
    @new_article = current_user.articles.build(article_params)
    if @new_article.save
      redirect_to articles_url
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url
  end

  private
    def article_params
      params.require(:article).permit(:user_id, :title, :body, :picture)
    end

    def check_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_url if @article.nil?
    end

end

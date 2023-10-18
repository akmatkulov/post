class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :check_user?, only: [:update]

  def index
    @article = Article.all
  end
  def new
    @article = Article.new
  end

  def creat
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

    @article = Article.find(params[:id])
    if check_user?(@article)
      if @article.update(article_params)
        redirect_to article_path(@article)
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url
  end

  private
    def article_params
      params.require(:article).permit(:user_id, :title, :body)
    end

    def check_user?(user)
      user.user_id == current_user.id
    end

end

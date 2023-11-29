class ArticlesController < ApplicationController
  before_action :login_required, except: [:show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :admin_or_current_user, except: [:show, :index, :new, :create]

  def show
  end

  def index
    if is_admin?
      @articles = Article.paginate(:page => params[:page], :per_page => 5)
    else
      @articles = authenticated_user.articles.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(set_article_params)
    @article.user = authenticated_user
    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: "Article was successfully created." }
        # format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(set_article_params)
        format.html { redirect_to articles_path, notice: "Article Updated Successfully" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article Deleted Successfully"
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def admin_or_current_user
    if !authenticated_user.is_admin && authenticated_user != @article.user
      flash[:notice] = "Insufficient Permission!!!"
      redirect_to user_login_path
    end
  end

  def set_article_params
    puts "*" * 100
    puts params.require(:article).permit(:title, :description, category_ids: [])
    params.require(:article).permit(:title, :description, category_ids: [])
  end
end

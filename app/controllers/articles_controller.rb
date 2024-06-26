class ArticlesController < ApplicationController
  # To provide secure acess to /article pages
  # http_basic_authenticate_with name: "test", password: "123"


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to root_path, status: :see_other
end

private
def article_params
  params.require(:article).permit(:title, :body, :author)
end

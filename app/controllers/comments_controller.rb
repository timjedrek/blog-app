class CommentsController < ApplicationController
  #http_basic_authenticate_with name: "tim", password: "jedrek", only: [:destroy, :update, :edit]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.update(comment_params)

    if @comment.update(comment_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end

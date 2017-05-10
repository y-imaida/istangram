class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
    @post_id = params[:format]
    @comment.post_id = @post_id
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to posts_path, notice: "コメントを投稿しました！"
    else
      @post_id = @comment.post_id
      render 'new'
    end
  end

  def edit
    @post_id = params[:format]
  end

  def update
    if @comment.update(comments_params)
      redirect_to posts_path, notice: "コメントを変更しました！"
    else
      @post_id = @comment.post_id
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path, notice: "コメントを削除しました！"
  end

  private
    def comments_params
      params.require(:comment).permit(:content, :post_id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end

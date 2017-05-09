class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "写真を投稿しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to posts_path, notice: "投稿の内容を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました！"
  end

  private
    def posts_params
      params.require(:post).permit(:title, :picture)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end

class PostsController < ApplicationController
  before_action :authenticate_account!
  before_action :find_post, only: [:show, :destroy]

  def index
    @posts = Post.all.limit(10).includes(:photos, :likes)
    @post = Post.new
  end

  def create
    @post = current_account.posts.build(post_params)
    @post.account = current_account
    if @post.save
      if params[:images]
        params[:images].each do |img|
          @post.photos.create(image: img)
        end
      end

      redirect_to posts_path
      flash[:notice] = "Saved ..."
    else
      flash[:alert] = "Something went wrong ..."
      redirect_to posts_path
    end
  end

  def show
    @photos = @post.photos
    @likes = @post.likes.includes(:account)
    @comment = Comment.new
    @is_liked = @post.is_liked(current_account)
    @is_saved = @post.is_saved(current_account)
    # set_meta_tags title: "Photo by "+@post.user.name
  end

  def destroy
      if @post.account == current_account
        if @post.destroy
          flash[:notice] = "Post deleted!"
        else
          flash[:alert] = "Something went wrong ..."
        end
      else
        flash[:notice] = "You don't have permission to do that!"
      end
      redirect_to root_path
  end

  private

  def find_post
    @post = Post.find_by id: params[:id]

    return if @post
    flash[:danger] = "Post not exist!"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:content)
  end
end

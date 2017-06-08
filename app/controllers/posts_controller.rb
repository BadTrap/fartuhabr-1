class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Стаття створена!'
    else
      render :new, danger: 'Стаття не створена!'
    end
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Стаття змінена!'
    else
      render :edit, danger: 'Стаття не змінена!'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, success: 'Видалена!'
  end


  private
  def post_params
    params.require(:post).permit(:title,:summary,:body, :all_tags, :image)
  end
end

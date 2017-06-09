class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
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
      flash.now[:danger] = 'Стаття не створена!'
      render :new
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
      flash.now[:danger] = 'Стаття не створена!'
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, success: 'Видалена!'
  end


  private
  def post_params
    params.require(:post).permit(:title,:summary,:body, :all_tags,:category_id, :image)
  end
end

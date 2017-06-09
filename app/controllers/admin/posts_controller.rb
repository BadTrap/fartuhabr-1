class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [ :edit, :update, :destroy ]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Стаття створена'
    else
      flash.now[:danger] = 'Стаття не створена'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to  @post, success: 'Стаття змінена'
    else
      flash.now[:danger] = 'Стаття не змінена'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Стаття успешно видалена'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id)
  end
end

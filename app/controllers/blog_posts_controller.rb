class BlogPostsController < ApplicationController
  def index
    @posts = BlogPost.all
  end

  def show
    @post = BlogPost.find_by(id: params[:id])
    redirect_to root_url unless @post
  end

  def new 
    @post = BlogPost.new
  end

  def edit
    @post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url
  end

  def update  
    @post = BlogPost.find(params[:id])
    if @post.update(post_params)
      redirect_to blog_post_path(@post)
    else
      render :edit, status: :unprocessable_entity  
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url
  end

  def create
    @post = BlogPost.new(post_params)
    if @post.save
      redirect_to blog_post_path(@post)  
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:blog_post).permit(:title, :body)
  end  
end

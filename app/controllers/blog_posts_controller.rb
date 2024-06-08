class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end
  def show
    @blog_post = BlogPost.find_by(id: params[:id])
    if @blog_post.nil?
      redirect_to root_url, alert: "Blog post not found."
    end
  def new
    @blog_post = BlogPost.new
  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: "Blog post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  def edit
    @blog_post = BlogPost.find_by(id: params[:id])
    if @blog_post.nil?
      redirect_to root_url, alert: "Blog post not found."
    end
  def update
    @blog_post = BlogPost.find_by(id: params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: "Blog post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  def destroy
    @blog_post = BlogPost.find_by(id: params[:id])
    if @blog_post
      @blog_post.destroy
      redirect_to root_url, notice: "Blog post was successfully deleted."
    else
      redirect_to root_url, alert: "Blog post not found."
    end
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end

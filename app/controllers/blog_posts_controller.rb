# frozen_string_literal: true

class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show]
  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end
end
  def index
    @blog_posts = BlogPost.all
  end

  def show; end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
end

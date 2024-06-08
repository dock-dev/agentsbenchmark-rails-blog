# frozen_string_literal: true

class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show]
  def index
    @blog_posts = BlogPost.all
  end

  def show; end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end

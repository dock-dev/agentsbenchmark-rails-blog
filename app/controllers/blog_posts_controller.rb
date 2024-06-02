# frozen_string_literal: true

class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find_by(id: params[:id]) 
    if @blog_post.nil?
      redirect_to root_url
    end
  end
end

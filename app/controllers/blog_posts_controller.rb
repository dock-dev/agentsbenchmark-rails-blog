class BlogPostsController < ApplicationController
  def index
    @posts = BlogPost.all
  end

  def show
    @post = BlogPost.find_by(id: params[:id])
    redirect_to root_url unless @post
  end
end

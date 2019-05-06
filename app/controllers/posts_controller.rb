class PostsController < ApplicationController

  def index
    @post_item = Post.all
  end

  def show
    @post_item = Post.find(params[:id])
  end

end
  
class PostsController < ApplicationController

  def index
    @posts_items = Post.all
  end

end
  
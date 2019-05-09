# frozen_string_literal: true

class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[new edit destroy]

  def index
    @posts = Post.all
    return unless user_signed_in?
      @currentUser = current_user.id
  end

  def show
    return unless user_signed_in?
      @currentUser = current_user.id
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = current_user.id
    @post = Post.new(params.require(:post).permit(:title ,:content ,:opened).merge(:user_id => @current_user))
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @post.update(params.require(:post).permit(:title,:content))
        format.html { redirect_to posts_path}
      else
        format.html { render :edit }
      end

    end

  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

end
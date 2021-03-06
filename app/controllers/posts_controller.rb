# frozen_string_literal: true

class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = Post.all
  end

  def show
    @comments = Comment.where(post_id: params[:id])
    @rankings = Ranking.where(user_id: current_user.id, post_id: @post.id)
    @ranking = @post.rankings.sum(:rank) / @post.rankings.count unless @post.rankings.count == 0
    @post.update(opened: true) if !current_user || current_user.id != @post.user.id
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @current_user = current_user.id
    @post = Post.new(posts_params.merge(user_id: @current_user))
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    respond_to do |format|
      if @post.update(posts_params)
        format.html { redirect_to posts_path }
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

  def set_post
    @post = Post.find(params[:id])
  end

  def posts_params
    params.require(:post).permit(:title, :content, :opened, category_ids: [])
  end

end

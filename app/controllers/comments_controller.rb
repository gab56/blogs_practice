# frozen_string_literal: true

class CommentsController < ApplicationController

  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_post, only: %i[new edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @current_user = current_user.id
    @comment = Comment.new(comment_params
    .merge(user_id: @current_user, post_id: params[:post_id]))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to posts_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end

end

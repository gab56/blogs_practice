# frozen_string_literal: true

class RankingsController < ApplicationController

  def new
    @ranking = Ranking.new
    @post = Post.find(params[:post_id])
    @rank_positions = %i[1 2 3 4 5 6 7 8 9 10]
  end

  def create
    @current_user = current_user.id
    @ranking = Ranking.new(posts_params.merge(user_id: @current_user, post_id: params[:post_id]))
    respond_to do |format|
      if @ranking.save
        format.html { redirect_to post_path(params[:post_id]) }
      else
        format.html { render :new }
      end
    end
  end

  def posts_params
    params.require(:ranking).permit(:rank)
  end

  def edit
    @post = Post.find(params[:post_id])
    @ranking = Ranking.find(params[:id])
    @rank_positions = %i[1 2 3 4 5 6 7 8 9 10]
  end

  def update
    @ranking = Ranking.find(params[:id])
    respond_to do |format|
      if @ranking.update(params.require(:ranking).permit(:rank))
        format.html { redirect_to posts_path }
      else
        format.html { render :edit }
      end
    end
  end

end

# frozen_string_literal: true

class PeopleController < ApplicationController

  before_action :set_person, only: %i[show edit update]
  before_action :set_user, only: %i[new edit]

  def new
    @person = Person.new
  end

  def edit;  end

  def update
    respond_to do |format|
      if @person.update(posts_params)
        format.html { redirect_to user_person_path(id: @person.id)  }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @current_user = current_user.id
    @person = Person.new(posts_params.merge(user_id: @current_user))
    respond_to do |format|
      if @person.save
        format.html { redirect_to user_person_path(id: @person.id) }
      else
        format.html { render :new }
      end
    end
  end

  def show; end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def posts_params
    params.require(:person).permit(:first_name, :last_name, :identificacion, :phone_number)
  end

end

class UsersController < ApplicationController

    def index
      @users_items = User.all
    end
  
  end
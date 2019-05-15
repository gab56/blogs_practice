# frozen_string_literal: true

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def user_params
    [
      :username, :email, :password, :password_confirmation, :remember_me, person_attributes: [
        :identificacion, :first_name, :last_name, :phone_number
      ]
    ]
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: user_params
    devise_parameter_sanitizer.permit :account_update, keys: user_params
  end

end

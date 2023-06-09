# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
 
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    account_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :profile_image, :introduction]) 
  end
 
 
end

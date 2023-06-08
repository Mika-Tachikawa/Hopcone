# frozen_string_literal: true

class Admin::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    admin_accounts_path
  end

  def after_sign_out_path_for(resource)
    admin_root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email]) 
  end
 
end

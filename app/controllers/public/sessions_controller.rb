# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    account_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email]) 
  end

# 退会しているかを判断し、退会済なら新規登録画面へ遷移
def user_state
  @account = User.find_by(email: params[:user][:email])
  return if !@account
  if @account.valid_password?(params[:user][:password])&& @account.is_deleted == true
    flash[:notice] = "You have already unsubscribed. Please create a new account."
    redirect_to new_user_registration_path
  else
    flash[:notice] = "Signed in successfully."
  end
end
 
end

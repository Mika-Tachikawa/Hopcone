# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

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
def customer_state
  @account = User.find_by(email: params[:user][:email])
  return if !@customer
  if @customer.valid_password?(params[:userr][:password])&& @user.is_deleted == true
    flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
    redirect_to new_user_registration_path
  else
    flash[:notice] = "ログインに成功しました。"
  end
end
 
end

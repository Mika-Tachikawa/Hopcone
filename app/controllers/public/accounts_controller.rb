class Public::AccountsController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
    
  def index
  end
  
  def show
    @account = User.find(params[:id]) 
    @reviews = @account.reviews
  end
  
  def edit
    @account = User.find(params[:id]) 
  end
  
  def update
    @account = User.find(params[:id])
    if @account.update(user_params)  # データ（レコード）を編集
      redirect_to account_path(@account), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to reviews_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end 
  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end

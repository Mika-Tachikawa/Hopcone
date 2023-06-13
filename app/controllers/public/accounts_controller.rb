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
    @account = current_user
  end

  def update
    @account = User.find(params[:id])
    if @account.update(user_params)  # データ（レコード）を編集
      redirect_to account_path(@account), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def withdrawal
    @account = current_user
    @account.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました。ご利用ありがとうございました。"
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
  
  def review_params
    params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment)
  end

end

class Public::AccountsController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @account = User.find(params[:id])
    @reviews = @account.reviews.page(params[:page])
  end

  def edit
    @account = current_user
    @accounts = User.find(params[:id])
    unless @accounts.id == @account.id
      redirect_to reviews_path
    end
  end

  def update
    @account = User.find(params[:id])
    unless @account.id == current_user.id
      redirect_to reviews_path
    end
    if @account.update(user_params)
      redirect_to account_path(@account), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def withdrawal
    @account = current_user
    @account.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "Withdrawal process has been completed."
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to reviews_path , notice: 'Guest users cannot access this feature.'
    end
  end

  def favorites
    @account = User.find(params[:id])
    @favorites = Favorite.where(user_id: @account.id).pluck(:review_id)
    @favorite_reviews = Review.find(@favorites)
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def review_params
    params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment)
  end

end
class Admin::AccountsController < ApplicationController

  def index
    @accounts = User.page(params[:page])
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
   if @account.update(user_params)
       redirect_to admin_account_path(@account), notice: 'You have updated user successfully.'
   else
       render :show, notice: 'Update failed.'
   end
  end
  
  def destroy
  end
  
    private

  def review_params
    params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :introduction)
  end

end

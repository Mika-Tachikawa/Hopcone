class Public::AccountsController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
    
  def index
  end
  
  def show
    #レビューデータが作成できたら下記のコメントアウトを外す
    @account = User.find(params[:id]) 
    @reviews = @account.reviews
  end
  
  def edit
    @account = User.find(params[:id]) 
  end
  
  def update
  end
  
  def destroy
  end
  
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to reviews_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end 
  
end

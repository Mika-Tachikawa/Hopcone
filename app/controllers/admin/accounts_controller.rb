class Admin::AccountsController < ApplicationController

  def index
    @accounts = User.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

end

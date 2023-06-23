class Guest::SessionsController < Devise::SessionsController
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to reviews_path, notice: 'Signed in as a guest.'
  end
  
end
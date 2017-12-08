class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    puts user_params
    if !User.exists?(email: user_params[:email])
    @temp_user = User.new(user_params)
    @temp_user.save
    session[:user_id] = @temp_user.id
    redirect_to '/'
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

end

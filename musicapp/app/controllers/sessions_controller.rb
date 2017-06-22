class SessionsController < ApplicationController

  def create
    @user = User.find_by_credential(user_params[:email], user_params[:password])
    if @user.nil?
      flash.now[:errors] = "Invalid email or password"
      redirect_to new_session_url
    else
      login(@user)
      redirect_to user_url(@user)
    end
  end

  def new
    render :new
  end

  def destroy
    logout
    redirect_to new_session_url
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome to Weather Forecast App'
    else
      redirect_to login_path, alert: 'Wrong password, try again!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

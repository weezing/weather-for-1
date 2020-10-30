class UsersController < ApplicationController
  def new
    @form = CreateUserForm.new
  end

  def create
    @form = CreateUserForm.new(user_form_params)
    service = CreateUserService.new(@form)

    if service.call
      session[:user_id] = service.user.id
      redirect_to root_path, notice: 'Registration successful'
    else
      render :new
    end
  end

  def destroy
    service = DestroyUserService.new(current_user)

    if service.call
      session[:user_id] = nil
      redirect_to root_path, notice: 'Account removed successfully'
    else
      redirect_to cities_path, alert: 'Something went wrong, try again'
    end
  end

  private

  def user_form_params
    params.require(:user_form)
          .permit(
            :email,
            :password,
            :password_confirmation
          )
  end
end

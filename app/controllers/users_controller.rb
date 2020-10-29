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

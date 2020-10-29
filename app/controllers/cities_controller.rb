class CitiesController < ApplicationController
  before_action :authenticate_user

  def index
    @cities = current_user.cities.order(name: :desc)
                                 .page(params[:page])
  end

  private

  def authenticate_user
    redirect_to login_path, alert: 'Log in to see the weather' unless current_user
  end
end

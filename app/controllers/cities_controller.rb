class CitiesController < ApplicationController
  before_action :authenticate_user
  before_action :find_city, only: [:destroy]

  def index
    @cities = current_user.cities.order(name: :desc)
                                 .page(params[:page])
  end

  def destroy
    service = DestroyCityService.new(@city)

    if service.call
      redirect_to cities_path, notice: 'City was successfully removed'
    else
      redirect_to cities_path, alert: 'Something went wrong, try again'
    end
  end

  private

  def authenticate_user
    redirect_to login_path, alert: 'Log in to see the weather' unless current_user
  end

  def find_city
    @city = City.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Record wit provided ID does not exist'
  end
end

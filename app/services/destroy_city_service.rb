class DestroyCityService
  def initialize(city)
    @city = city
  end

  def call
    destroy_city
  end

  private

  attr_reader :city

  def destroy_city
    city.destroy
  end
end

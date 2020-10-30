class WeatherDataQuery
  def initialize(city)
    @city = city
  end

  def results
    HTTParty.get(
      base_url + query_params + weather_api_key_param
    ).parsed_response
  end

  private

  attr_reader :city

  def base_url
    'https://api.openweathermap.org/data/2.5/onecall'
  end

  def query_params
    "?lat=#{@city.latitude}&lon=#{@city.longitude}&exclude=minutely,hourly&units=metric"
  end

  def weather_api_key_param
    "&appid=#{Rails.application.credentials.weather_api_key}"
  end
end

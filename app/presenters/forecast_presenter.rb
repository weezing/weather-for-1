class ForecastPresenter
  attr_reader :forecast_data, :day

  def initialize(forecast_data, day)
    @forecast_data = forecast_data
    @day = day
  end

  def temperature
    forecast_data['daily'][day]['temp']['day'] || 'N/A'
  end

  def pressure
    forecast_data['daily'][day]['pressure'] || 'N/A'
  end

  def humidity
    forecast_data['daily'][day]['humidity'] || 'N/A'
  end

  def clouds
    forecast_data['daily'][day]['clouds'] || 'N/A'
  end

  def summary
    forecast_data['daily'][day]['weather'][0]['main'] || 'N/A'
  end
end

class GardenService
  def frost_dates
    get_url("/frostDates")
  end

  def seven_day_forecast
    get_url("/sevenDayForecast")
  end

  def hardiness_zone
    get_url("/hardinessZone")
  end

  def get_url(url)
    response = Faraday.get("https://ancient-basin-82077.herokuapp.com/api/v1#{url}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end

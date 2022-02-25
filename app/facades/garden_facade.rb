class GardenFacade
  def frost_dates
    service.frost_dates.map {|data| FrostDates.new(data)}
  end

  def hardiness_zone
    service.hardiness_zone.map {|data| HardinessZone.new(data)}
  end

  def seven_day_forecast
    service.seven_day_forecast.map {|data| SevenDayForecast.new(data)}
  end
  
  def service
    GardenService.new
  end
end

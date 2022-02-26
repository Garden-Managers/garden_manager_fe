class GardenFacade
  def frost_dates(id)
    service.get_frost_dates(id).map { |data| FrostDate.new(data) }
  end

  def hardiness_zone
    service.hardiness_zone.map { |data| HardinessZone.new(data) }
  end

  def forecast(id)
    service.get_forecast(id)[:daily].map { |data| Forecast.new(data) }
  end

  def service
    GardenService.new
  end
end

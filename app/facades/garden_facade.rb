class GardenFacade
  def frost_dates(id)
    service.get_frost_dates(id).map { |data| FrostDate.new(data) }
  end

  def forecast(id)
    service.get_forecast(id)[:attributes][:weekly_forecast].map { |data| Forecast.new(data) }
  end

  def find_user(id)
    User.new(service.get_user(id)[:data])
  end

  def plants(id)
    service.get_user_plants(id)[:data].map do |data|
      Plant.new(data)
    end
  end

  def service
    GardenService.new
  end
end

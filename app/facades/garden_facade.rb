class GardenFacade
  
  def find_user_by_email(email)
    User.new(service.get_email(email)[:data])  
  end
  
  def frost_dates(id)
    service.get_frost_dates(id).map { |data| FrostDate.new(data) }
  end

  def forecast(id)
    service.get_forecast(id)[:daily].map { |data| Forecast.new(data) }
  end

  def find_user(id)
    User.new(service.get_user(id)[:data])
  end

  def service
    GardenService.new
  end
end

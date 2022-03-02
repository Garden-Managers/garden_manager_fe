class GardenFacade
  def find_user_by_email(email)
    response = service.get_email(email)
    if response[:message].present?
      nil
    else
      User.new(response[:data])
    end
  end

  def create_user(email, name)
    User.new(service.create_user(email, name)[:data])
  end

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

  def add_plant(plant)
    Plant.new(service.create_plant(plant[:name], plant[:frost_date], plant[:maturity])[:data])
  end

  def all_plants
    service.all_plants[:data].map do |data|
      Plant.new(data)
    end
  end

  def update_user(zip)
    User.new(service.update_user(zip)[:data])
  end

  def service
    GardenService.new
  end
end

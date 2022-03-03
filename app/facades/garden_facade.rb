class GardenFacade
  def self.find_user_by_email(email)
    response = GardenService.get_user_by_email(email)
    if response[:message].present?
      nil
    else
      User.new(response[:data])
    end
  end

  def self.create_user(email, name)
    User.new(GardenService.create_user(email, name)[:data])
  end

  def self.frost_dates(user_id)
    GardenService.get_frost_dates(user_id).map { |data| FrostDate.new(data) }
  end

  def self.forecast(user_id)
    GardenService.get_forecast(user_id)[:attributes][:weekly_forecast].map { |data| Forecast.new(data) }
  end

  def self.find_user(user_id)
    User.new(GardenService.get_user(user_id)[:data])
  end

  def self.plants(user_id)
    GardenService.get_user_plants(user_id)[:data].map do |data|
      Plant.new(data)
    end
  end

  def self.add_plant(plant)
    Plant.new(GardenService.create_plant(plant[:name], plant[:frost_date], plant[:maturity])[:data])
  end

  def self.all_plants
    GardenService.all_plants[:data].map do |data|
      Plant.new(data)
    end
  end

  def self.update_user(zip)
    User.new(GardenService.update_user(zip)[:data])
  end
end

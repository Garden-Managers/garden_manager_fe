class GardenService
  def self.get_email(email)
    get_url("/api/v1/user?email=#{email}")
  end

  def self.create_user(email, name)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:email] = email
      faraday.params[:name] = name
    end
    response = conn.post('/api/v1/users')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_user_plant(user_id, plant_id)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:user_id] = user_id
      faraday.params[:plant_id] = plant_id
    end
    response = conn.post('/api/v1/user_plants')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_user(zip)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:zip] = zip
    end
    response = conn.patch('/api/v1/users/1')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_plant(name, frost_date, maturity)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:maturity] = maturity
      faraday.params[:name] = name
      faraday.params[:frost_date] = frost_date
    end
    response = conn.post('/api/v1/plants')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user_by_email(email)
    get_url("user?email=#{email}")
  end

  def self.create_user(email, name)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:email] = email
      faraday.params[:name] = name
    end
    response = conn.post('/api/v1/users')
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_frost_dates(user_id)
    get_url("users/#{user_id}/frost_dates")
  end

  def self.get_forecast(user_id)
    get_url("users/#{user_id}/forecast")
  end

  def self.get_user(user_id)
    get_url("users/#{user_id}")
  end

  def self.get_user_plants(user_id)
    get_url("users/#{user_id}/plants")
  end

  def self.all_plants
    get_url('plants')
  end

  def self.get_url(url)
    response = Faraday.get("https://ancient-basin-82077.herokuapp.com/api/v1/#{url}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end

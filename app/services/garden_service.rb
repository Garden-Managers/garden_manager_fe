class GardenService
  def get_email(email)
    get_url("/api/v1/user?email=#{email}")
  end

  def create_user(email, name)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:email] = email
      faraday.params[:name] = name
    end
    response = conn.post('/api/v1/users')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def create_user_plant(user_id, plant_id)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:user_id] = user_id
      faraday.params[:plant_id] = plant_id
    end
    response = conn.post('/api/v1/user_plants')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def update_user(zip)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:zip] = zip
    end
    response = conn.patch('/api/v1/users/1')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def create_plant(name, frost_date, maturity)
    conn = Faraday.new('https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:maturity] = maturity
      faraday.params[:name] = name
      faraday.params[:frost_date] = frost_date
    end
    response = conn.post('/api/v1/plants')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def get_frost_dates(id)
    get_url("/api/v1/users/#{id}/frostDates")
  end

  def get_forecast(id)
    get_url("/api/v1/users/#{id}/forecast")
  end

  def get_user(id)
    get_url("/api/v1/users/#{id}")
  end

  def get_user_plants(id)
    get_url("api/v1/users/#{id}/plants")
  end

  def all_plants
    get_url('/api/v1/plants')
  end

  def get_url(url, query = nil)
    conn = Faraday.new(url: 'https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:query] = query unless query.nil?
    end

    response = conn.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end
end

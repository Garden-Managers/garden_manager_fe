class GardenService

  def self.get_user_by_email(email)
    get_url("user?email=#{email}")
  end

  def self.create_user(email, name)
    conn = Faraday.new("https://ancient-basin-82077.herokuapp.com") do |faraday|
      faraday.params[:email] = email
      faraday.params[:name] = name
    end
    response = conn.post("/api/v1/users")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_frost_dates(user_id)
    get_url("users/#{user_id}/frostDates")
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

  def self.get_url(url)
    response = Faraday.get("https://ancient-basin-82077.herokuapp.com/api/v1/#{url}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end

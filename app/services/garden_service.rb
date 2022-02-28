class GardenService
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

  def get_url(url, query = nil)
    conn = Faraday.new(url: 'https://ancient-basin-82077.herokuapp.com') do |faraday|
      faraday.params[:query] = query unless query.nil?
    end

    response = conn.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end
end

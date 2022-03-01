class User
  attr_reader :user_id, :zip, :latitude, :longitude, :name

  def initialize(data)
    @user_id = data[:id]
    @name = data[:attributes][:name]
    @zip = data[:attributes][:zip]
    @latitude = data[:attributes][:latitude]
    @longitude = data[:attributes][:longitude]
  end
end

class User
  attr_reader :user_id, :zip, :latitude, :longitude

  def initialize(data)
    require "pry"; binding.pry
    @user_id = data[:id]
    @zip = data[:attributes][:zip]
    @latitude = data[:attributes][:latitude]
    @longitude = data[:attributes][:longitude]
  end
end

class SevenDayForecast
  attr_reader :low, :high, :weather_type
  def initialize(data)
    @low = data[:min_temp]
    @high = data[:max_temp]
    @weather_type = data[:weather_type]
  end
end 

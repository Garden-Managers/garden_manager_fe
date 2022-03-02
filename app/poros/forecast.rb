class Forecast
  attr_reader :low, :high, :weather, :date

  def initialize(data)
    @date = data[:dt]
    @low = data[:min]
    @high = data[:max]
    @weather = data[:weather]
  end

  def date_format
    @date.to_date.strftime("%A %b %-d")
  end
end

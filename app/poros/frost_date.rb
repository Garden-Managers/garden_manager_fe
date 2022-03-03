class FrostDate
  attr_reader :season, :temperature_threshold, :date

  def initialize(data)
    @season = data[:season]
    @temperature_threshold = data[:temperature_threshold]
    @date = data[:prob_50]
  end
end

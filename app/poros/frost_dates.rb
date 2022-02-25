class FrostDates
  attr_reader :spring, :fall
  def initialize(data)
    @spring = data[:spring_date]
    @fall = data[:fall_date]
  end
end 

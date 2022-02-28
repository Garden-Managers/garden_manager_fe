class Plant
  attr_reader :id, :name, :frost_date, :maturity

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @frost_date = data[:attributes][:frost_date]
    @maturity = data[:attributes][:maturity]
  end
end

class User
  attr_reader :user_id, :hardiness_zone

  def initialize(data)
    @user_id = data[:user_id]
    @hardiness_zone = data[:attributes][:hardiness_zone]
  end
end

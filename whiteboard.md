FE sends the zipcode to BE,
  -BE takes zip and finds lat and long
    -then BE inputs lat and long into farmsense api for a station(selecting the station in the first position)
      -BE will then request an api for the set of frost dates that correlate with the spring season and fall season at the temperature of 32F
        -FE will receive the result from above request and apply that to the user dashboard


        class FrostDates
          initialize(data)
          @spring = data[:spring]
          @fall = data[:fall]
          @growing_season = data[:growing_season](in days) -- Reach Goal

          First frost is projected to be: date.spring

          Last Frost is projected to be: date.fall

          Your growing season is expected to start on date.spring and end on date.fall

          Disclaimer! Frost date temperature is rated at 32F


Seven day forecast
  -FE will send zipcode to BE
    -BE will convert zip into lat and long
      -BE will input lat and long into Openweather api
        -BE will return daily,temp: min and max, weather: main


Plant attribute needs:
  - Name of plant(ex:Tomato, possibly add type in future)
  - Days before/after spring frost date(negative days for before and positive days for after) to plant
  - Maturity(in days)
  - Picture of plant
  -
_---------------------------------------------------------------------------
  def current_user
      @user = User.find(session[:user_id]) if session[:user_id]
    end

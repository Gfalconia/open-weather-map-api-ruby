module OpenWeatherMapApi
    class Client
      attr_reader :api_key, :lat, :lon
        BASE_URL = "https://api.openweathermap.org/data/2.5/onecall?"

        def initialize(api_key:, lat:, lon:)
          @api_key = api_key
          @lat = lat
          @lon = lon
        end

        def connect
          response = Faraday.get(BASE_URL + "lat=#{@lat}&lon=#{@lon}&appid=#{@api_key}") do |req|
        end
          data = JSON.parse(response.body, object_class: OpenStruct)
        end

    end
end
module OpenWeatherMapApi
    class Client
      attr_reader :api_key, :lat, :lon
        
    
        def initialize(api_key:, lat:, lon:, adapter: Faraday.default_adapter )
          @api_key = api_key
          @lat = lat
          @lon = lon
          @adapter = adapter
          @url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{@lat}&lon=#{@lon}&appid=#{@api_key}"
        end

        def get_request(url, params: {}, headers: {})
          handle_response self.connection.get(url, params, headers)
        end

        def handle_response(response)
          case response.status
          when 400
            raise Error, "Your request was malformed. #{response.body["error"]}"
          when 401
            raise Error, "You did not supply valid authentication credentials. #{response.body["error"]}"
          when 403
            raise Error, "You are not allowed to perform that action. #{response.body["error"]}"
          when 404
            raise Error, "No results were found for your request. #{response.body["error"]}"
          when 429
            raise Error, "Your request exceeded the API rate limit. #{response.body["error"]}"
          when 500
            raise Error, "We were unable to perform the request due to server-side problems. #{response.body["error"]}"
          when 503
            raise Error, "You have been rate limited for sending more than 20 requests per second. #{response.body["error"]}"
          end
    
          response.body
        end

        def list(**params)
            response = get_request(@url, params: params)
            #Collection.from_response(response, key: "bare_metals", type: BareMetal)
        end

    def connection
      @connection ||= Faraday.new(@url) do |conn|
        conn.request :authorization, :Bearer, @api_key
        conn.request :json

        conn.response :dates
        conn.response :json, content_type: "application/json"

        conn.adapter @adapter, @stubs
      end
    end

      end
end
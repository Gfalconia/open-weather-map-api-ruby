module OpenWeatherMapApi
    class Resource
      attr_reader :client
  
      def initialize(client)
        @client = client
      end
  
      private
  
      def post_request(url, body:, headers: {})
        handle_response client.connection.post(url, body, headers)
      end
  
      def patch_request(url, body:, headers: {})
        handle_response client.connection.patch(url, body, headers)
      end
  
      def put_request(url, body:, headers: {})
        handle_response client.connection.put(url, body, headers)
      end
  
      def delete_request(url, params: {}, headers: {})
        handle_response client.connection.delete(url, params, headers)
      end
  

    end
  end
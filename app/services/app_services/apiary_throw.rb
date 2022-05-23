module AppServices
  class ApiaryThrow
 
    require 'httparty'
 
    def call
      result = HTTParty.get("https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw")
      if result['statusCode'] == 200
        result['body']
      else
        local_throw
      end
    end
 
    private
      def local_throw
        ['Paper', 'Rock', 'Scissors'].sample
      end
  end
end
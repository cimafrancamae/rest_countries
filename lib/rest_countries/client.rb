require "faraday"
require "faraday_middleware"

module RestCountries
  class Client
    BASE_URL = "https://restcountries.com/v3.1/"

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request = :json
        conn.response = :json, content_type: "application/json"
        conn.adapter adapter
      end
    end
  end
end

require "faraday"
# require "faraday_middleware"

module RestCountries
  class Client
    BASE_URL = "https://restcountries.com/v3.1/"

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end

    def all
      response = connection.get("all")
      handle_response(response)
    end

    # Search by country name. If you want to get an exact match, use the next endpoint. It can be the common or official value
    def name(country_name)
      response = connection.get("name/#{country_name}")
      handle_response(response)
    end

    # Search by country’s full name. It can be the common or official value
    def fullname(country_name)
      response = connection.get("name/#{country_name}?fullText=true")
      handle_response(response)
    end

    # Search by cca2, ccn3, cca3 or cioc country code
    def code(code)
      response = connection.get("alpha/#{code}")
      handle_response(response)
    end

    # List of codes
    def codes(codes)
      response = connection.get("alpha?codes=#{codes.join(',')}")
      handle_response(response)
    end

    # Search by currency code or name
    def currency(currency)
      response = connection.get("currency/#{currency}")
      handle_response(response)
    end

    # Search by how a citizen is called
    def demonym(demonym)
      response = connection.get("demonym/#{demonym}")
      handle_response(response)
    end

    # Search by language code or name
    def language(language)
      response = connection.get("lang/#{language}")
      handle_response(response)
    end

    # Search by capital city
    def capital(capital)
      response = connection.get("capital/#{capital}")
      handle_response(response)
    end

    # Search by region
    def region(region)
      response = connection.get("region/#{region}")
      handle_response(response)
    end

    # Search by subregions
    def subregion(subregion)
      response = connection.get("subregion/#{subregion}")
      handle_response(response)
    end

    # Search by any translation name
    def translation(translation)
      response = connection.get("translation/#{translation}")
      handle_response(response)
    end

    # Filter the output of your request to include only the specified fields.
    def filter(service, fields)
      response = connection.get("#{service}?fields=#{fields.join(',')}")
      handle_response(response)
    end

    private

    def handle_response(response)
      if response.success?
        response.body
      else
        raise "Error fetching data: #{response.status}"
      end
    end
  end
end

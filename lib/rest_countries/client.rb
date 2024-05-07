require "faraday"
require "faraday_middleware"

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

    def get_all_countries
      response = connection.get("all")
      handle_response(response)
    end

    # Search by country name. If you want to get an exact match, use the next endpoint. It can be the common or official value
    def get_country_by_name(country_name)
      response = connection.get("name/#{country_name}")
      handle_response(response)
    end

    # Search by country’s full name. It can be the common or official value
    def get_country_by_full_name(country_name)
      response = connection.get("name/#{country_name}?fullText=true")
      handle_response(response)
    end

    # Search by cca2, ccn3, cca3 or cioc country code
    def get_countries_by_code(code)
      response = connection.get("alpha/#{code}")
      handle_response(response)
    end

    # List of codes
    def get_countries_by_codes(codes)
      response = connection.get("alpha/codes=#{codes.join(',')}")
      handle_response(response)
    end

    # Search by currency code or name
    def get_country_by_currency(currency)
      response = connection.get("currency/#{currency}")
      handle_response(response)
    end

    # Search by how a citizen is called
    def get_country_by_demonym(demonym)
      response = connection.get("demonym/#{demonym}")
      handle_response(response)
    end

    # Search by language code or name
    def get_country_by_language(language)
      response = connection.get("lang/#{language}")
      handle_response(response)
    end

    # Search by capital city
    def get_country_by_capital(capital)
      response = connection.get("capital/#{capital}")
      handle_response(response)
    end

    # Search by region (replace X with the version you want to use)
    def get_country_by_region(region)
      response = connection.get("region/#{region}")
      handle_response(response)
    end

    # Search by subregions (replace X with the version you want to use)
    def get_country_by_subregion(subregion)
      response = connection.get("subregion/#{subregion}")
      handle_response(response)
    end

    # Search by any translation name
    def get_country_by_translation(translation)
      response = connection.get("translation/#{translation}")
      handle_response(response)
    end

    # Filter the output of your request to include only the specified fields.
    def get_countries_by_filter(service, fields)
      response = connection.get("#{service}/fields=#{fields.join(',')}")
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

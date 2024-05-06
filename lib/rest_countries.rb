# frozen_string_literal: true

require_relative "rest_countries/version"

module RestCountries
  autoload :Client, "rest_countries/client"
  autoload :Error, "rest_countries/error"
end

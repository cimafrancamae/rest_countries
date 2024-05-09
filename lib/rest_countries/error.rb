module RestCountries
  class Error < StandardError; end
  class NotFoundError < Error; end
  class ClientError < Error; end
  class ServerError < Error; end
end

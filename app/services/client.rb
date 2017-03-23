class Client
  URI = 'http://tweeps.locaweb.com.br/search/tweets.json'.freeze

  class << self
    def search
      response = request(:get)
      parse_response(response)
    end

    private

    def parse_response(request)
      JSON.parse(request)
    end

    def request(method)
      RestClient::Request.execute(
        method: method,
        url: URI,
        headers: { username: 'mail@mail.com' }
      )
    end
  end
end

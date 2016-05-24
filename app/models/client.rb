class Client
  attr_accessor :request, :response

  def initialize(username = nil)
    @username = username
  end

  def get(route = nil, params = {})
    return 'Unauthorized' if @username.nil?

    request(:get, route, params)
  end

  private

  def request(method, route, params = {})
    request = RestClient::Request.execute(
                method: method,
                url: url(route),
                params: params,
                headers: { username: @username }
              )
    response(request)
  end

  def response(request_response)
    JSON.parse(request_response)
  end

  def url(route = '')
    base_url + route.to_s
  end

  def base_url
    'http://tweeps.locaweb.com.br'
  end
end

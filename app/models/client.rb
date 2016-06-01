class Client
  attr_accessor :request, :response

  def get(route = '', params = {})
    @request = request(:get, route, params)
  end

  def response
    @response = JSON.parse(@request)
  end

  private

  def request(method, route = '', params = {})
    request = RestClient::Request.execute(
                method: method,
                url: url(route),
                params: params,
                headers: { username: 'mymail@mail.com' }
              )
  end

  def url(route = '')
    base_url + route.to_s
  end

  def base_url
    'http://tweeps.locaweb.com.br'
  end
end

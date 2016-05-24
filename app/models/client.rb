class Client
  attr_accessor :request

  def initialize(username = nil)
    @username = username
  end

  def get(route = nil, params = {})
    return 'Unauthorized' if @username.nil?

    RestClient::Request.execute(
      method: :get,
      url: self.url(route),
      params: params,
      headers: @username
    )
  end

  def url(route = nil)
    base_url + route.to_s
  end

  private

  def base_url
    'http://tweeps.locaweb.com.br'
  end
end

class Mention < Client
  attr_accessor :username

  def initialize(username = nil)
    @username = username
  end

  def all
    response = get(route, params)
    response['statuses']
  end

  private

  def route
    '/search/tweets.json'
  end

  def params
    'paf=tweets&q=@locaweb -to:locaweb -from:locaweb'
  end


end

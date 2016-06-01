class Mention
  SEARCH_URI = '/search/tweets.json'

  attr_accessor :tweets

  def initialize
    @request = Client.new
  end

  def all
    @request.get(SEARCH_URI)

    get_mentions
    filter_replies
  end


  private

  def get_mentions
    return [] if @request.response.blank?
    @tweets =  @request.response['statuses'].select { |tweet| /@locaweb/.match(tweet['text']) }
  end

  def filter_replies
    return [] if @tweets.blank?
    @tweets = @tweets.select { |tweet| tweet['in_reply_to_user_id'] != 42 }
  end
end

class Mention
  SEARCH_URI = '/search/tweets.json'.freeze
  USER_ID    = 42

  attr_accessor :tweets

  def initialize
    @request = Client.new
  end

  def all
    @request.get(SEARCH_URI)

    mentions
    filter_replies
  end

  private

  def mentions
    return [] if @request.response.blank?
    @tweets = @request.response['statuses']
              .select { |tweet| /@locaweb/.match(tweet['text']) }
  end

  def filter_replies
    return [] if @tweets.blank?
    @tweets = @tweets.select { |tweet| tweet['in_reply_to_user_id'] != USER_ID }
  end
end

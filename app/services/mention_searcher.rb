class MentionSearcher
  USER_ID = 42

  attr_accessor :tweets

  class << self
    def all
      result = Client.search
      return [] if result.blank?

      result['statuses'].select { |tweet| /@locaweb/.match(tweet['text']) }
    end

    def without_replies
      result = self.all
      return [] if result.blank?

      result.select { |tweet| tweet['in_reply_to_user_id'] != USER_ID }
    end
  end
end

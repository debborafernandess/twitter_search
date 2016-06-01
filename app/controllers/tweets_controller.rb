class TweetsController < ApplicationController

  def index
    @tweets = Tweet.search
  end

  private

  def tweets
    # mentions = Mention.new(username: cookies[:user])
    # tweets = mentions.all
    # tweets = mentions.filter_replies
    # tweets = tweets.sort_by! { |k, v| v }

    # @tweets = tweets.inject([]) { |ary, tweet| ary << Tweet.new(tweet) } unless tweets.blank?
  end
end

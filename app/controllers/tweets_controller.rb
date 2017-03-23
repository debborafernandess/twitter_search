class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all || search
  end

  def search
    @tweets = TweetBuilder.save
    redirect_to tweets_path
  end

  def mentionners
    @tweets = Tweet.top_mentioners
  end
end

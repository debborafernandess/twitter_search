class TweetsController < ApplicationController
  def index
    @tweets = Tweet.search
  end

  def search
    @tweets = Tweet.search(more: true)
    redirect_to tweets_path
  end
end

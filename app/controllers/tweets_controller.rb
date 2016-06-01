class TweetsController < ApplicationController
  def index
    @tweets = Tweet.search
  end
end

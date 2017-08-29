class TweetsController < ApplicationController
  def index
    @tweets = Tweet.
      order(replays_count: :desc).
      page(params[:page])
  end
end

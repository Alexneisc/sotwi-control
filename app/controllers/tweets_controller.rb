class TweetsController < ApplicationController
  def index
    params[:date] ||= Time.current.to_date

    @tweets = Tweet.
      for_date(params[:date]).
      order(replays_count: :desc).
      page(params[:page])
  end
end

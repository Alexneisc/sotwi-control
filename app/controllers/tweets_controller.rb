class TweetsController < ApplicationController
  def index
    params[:date] ||= Time.current.to_date

    unpaginated_tweets = Tweet.
      for_date(params[:date]).
      order(retweets_count: :desc)

    @tweets_count = unpaginated_tweets.count
    @tweets = unpaginated_tweets.page(params[:page])
  end
end

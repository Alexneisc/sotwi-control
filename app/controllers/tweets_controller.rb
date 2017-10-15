class TweetsController < ApplicationController
  def index
    params[:date] ||= Time.current.to_date

    unpaginated_tweets = Tweet.
      for_date(params[:date]).
      order(retweets_count: :desc)

    @tweets_count = unpaginated_tweets.count
    @tweets = unpaginated_tweets.page(params[:page])
  end

  def show
    @tweet = Tweet.find(params[:id])

    unpaginated_retweets = Retweet.
      where(tweet_id: @tweet.id).
      for_date(params[:date]).
      order(collected_at: :desc)

    @retweets_count = unpaginated_retweets.count
    @retweets = unpaginated_retweets.page(params[:page])
  end
end

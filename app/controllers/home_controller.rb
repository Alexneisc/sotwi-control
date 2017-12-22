class HomeController < ApplicationController
  def index
    @total_stats = {
      today: {
        tweets: Tweet.for_date(Date.today).count,
        retweets: Tweet.for_date(Date.today).sum(:retweets_count),
      },
      yesterday: {
        tweets: Tweet.for_date(Date.yesterday).count,
        retweets: Tweet.for_date(Date.yesterday).sum(:retweets_count),
        winner: Winner.find_by(date: Date.yesterday),
      }
    }

    @fresh_stats = TweetStatsForDates.new([Date.today, Date.yesterday]).call

    if params[:date].present?
      @stats_for_date = TweetStatsForDates.new(params[:date]).call
    end
  end
end

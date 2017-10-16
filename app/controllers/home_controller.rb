class HomeController < ApplicationController
  def index
    @tweets_today = Tweet.for_date(Time.current.to_date).count
    @retweets_today = Tweet.for_date(Time.current.to_date).sum(:retweets_count)
    @tweets_yesterday = Tweet.for_date(Date.yesterday).count
    #TODO Почему-то @retweets_yesterday обновляется прям на глазах. Т.е. туда попадают сегодняшние ретвиты
    @retweets_yesterday = Tweet.for_date(Date.yesterday).sum(:retweets_count)
    @winner_yesterday = Winner.find_by(date: Date.yesterday)

    if params[:date].present?
      @tweets_for_date = Tweet.for_date(params[:date]).count
      @retweets_for_date = Tweet.for_date(params[:date]).sum(:retweets_count)
      @winner_for_date = Winner.find_by(date: params[:date])
    end
  end
end

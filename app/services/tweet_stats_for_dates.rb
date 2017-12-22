class TweetStatsForDates
  def initialize(dates=nil)
    @dates = dates
  end

  def call
    Tweet.
      left_joins(:winner).
      where('collected_at::date in (?)', @dates).
      select('
        count(*) as total,
        sum(retweets_count) as total_retweets,
        collected_at::date as date,
        collected_by_tag as tag,
        max(winners.id) as winner_id
      ').
      group('collected_at::date', :collected_by_tag).
      order('date DESC')
  end
end

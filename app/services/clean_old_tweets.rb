class CleanOldTweets
  def call
    date = 7.days.ago.strftime('%Y-%m-%d')
    tweets = Tweet.
      where("collected_at::date = '#{date}'").
      order(retweets_count: :desc).
      order(:id).
      offset(10)

    tweets.destroy_all
  end
end

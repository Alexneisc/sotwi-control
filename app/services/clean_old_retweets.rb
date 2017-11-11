class CleanOldRetweets
  def call
    date = 7.days.ago.strftime('%Y-%m-%d')
    retweets = Retweet.where("collected_at::date = '#{date}'")

    retweets.delete_all
  end
end

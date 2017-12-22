class CleanOldTweets
  def call
    date = 7.days.ago.strftime('%Y-%m-%d')

    tags = Tweet.uniq_tags_for(date)

    tags.each do |tag|
      destroy_tag(date, tag)
    end
  end

  def destroy_tag(date, tag)
    tweets = Tweet.
      where("collected_at::date = '#{date}'").
      where(collected_by_tag: tag).
      order(retweets_count: :desc).
      order(:id).
      offset(10)

    tweets.destroy_all
  end
end

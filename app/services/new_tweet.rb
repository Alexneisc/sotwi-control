class NewTweet
  def initialize(datetime, tweet_data={}, retweet_data={})
    @datetime = datetime
    @tweet_data = tweet_data
    @retweet_data = retweet_data
  end

  def processing
    date = Date.parse(@datetime).strftime('%Y-%m-%d')

    if @tweet_data['is_retweet']
      tweet = if Tweet.where('datetime::DATE = ?', date).exists?(twitter_id: @retweet_data['id'])
        Tweet.find_by(twitter_id: @retweet_data['id'])
      else
        create_tweet(
          @datetime,
          @retweet_data
        )
      end

      unless Retweet.where('datetime::DATE = ?', date).exists?(user_id: @tweet_data['user_id'], tweet_id: tweet.id)
        create_retweet(
          tweet.id,
          @datetime,
          @tweet_data
        )
      end
    else
      unless Tweet.where('datetime::DATE = ?', date).exists?(twitter_id: @tweet_data['id'])
        create_tweet(
          @datetime,
          @tweet_data
        )
      end
    end
  end

  def create_tweet(datetime, data={})
    Tweet.create(
      twitter_id: data['id'],
      text: data['text'],
      user_id: data['user_id'],
      user_name: data['user_name'],
      user_screen_name: data['user_screen_name'],
      twitter_created_at: data['created_at'],
      is_retweet: data['is_retweet'],
      datetime: datetime
    )
  end

  def create_retweet(tweet_id, datetime, data={})
    Retweet.create(
      twitter_id: data['id'],
      user_id: data['user_id'],
      user_name: data['user_name'],
      user_screen_name: data['user_screen_name'],
      tweet_id: tweet_id,
      datetime: datetime
    )
  end
end

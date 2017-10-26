class NewTweet
  def initialize(collected_at, tweet_data={}, retweet_data={})
    @collected_at = collected_at
    @tweet_data = tweet_data
    @retweet_data = retweet_data
  end

  def processing
    date = Date.parse(@collected_at).strftime('%Y-%m-%d')

    if @tweet_data['is_retweet']
      tweet = if Tweet.where('collected_at::DATE = ?', date).exists?(twitter_id: @retweet_data['id'])
        Tweet.where('collected_at::DATE = ?', date).find_by(twitter_id: @retweet_data['id'])
      else
        create_tweet(
          @collected_at,
          @retweet_data
        )
      end

      unless Retweet.where('collected_at::DATE = ?', date).exists?(user_id: @tweet_data['user_id'], tweet_id: tweet.id)
        create_retweet(
          tweet.id,
          @collected_at,
          @tweet_data
        )
      end
    else
      unless Tweet.where('collected_at::DATE = ?', date).exists?(twitter_id: @tweet_data['id'])
        create_tweet(
          @collected_at,
          @tweet_data
        )
      end
    end
  end

  def create_tweet(collected_at, data={})
    Tweet.create(
      twitter_id: data['id'],
      text: data['text'],
      user_id: data['user_id'],
      user_name: data['user_name'],
      user_screen_name: data['user_screen_name'],
      twitter_created_at: data['created_at'],
      is_retweet: data['is_retweet'],
      collected_at: collected_at,
    )
  end

  def create_retweet(tweet_id, collected_at, data={})
    Retweet.create(
      twitter_id: data['id'],
      user_id: data['user_id'],
      user_name: data['user_name'],
      user_screen_name: data['user_screen_name'],
      tweet_id: tweet_id,
      collected_at: collected_at,
      twitter_created_at: data['created_at'],
    )
  end
end

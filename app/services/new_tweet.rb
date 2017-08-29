class NewTweet
  def initialize(tw_id, unformatted_text, user_id, user_name, user_screen_name, datetime)
    @tw_id = tw_id
    @unformatted_text = unformatted_text
    @user_id = user_id
    @user_name = user_name
    @user_screen_name = user_screen_name
    @datetime = datetime
  end

  def processing
    # Retweet example:
    # RT @SalamaChiroWS: We couldn't resist sharing! #LOL https://t.co/C5VYZ0w53a

    text = @unformatted_text.gsub(/^RT @(.+?): /, '').gsub(/#{Tweet::TWITTER_TOPIC}/i, '').strip
    text_hash = Digest::MD5.hexdigest(text)

    tweet = if Tweet.exists?(text_hash: text_hash)
      Tweet.find_by(text_hash: text_hash)
    else
      Tweet.create(
        tw_id: @tw_id,
        text: text,
        text_hash: text_hash,
        datetime: @datetime,
      )
    end

    unless Replay.exists?(user_id: @user_id, tweet_id: tweet.id)
      Replay.create(
        tw_id: @tw_id,
        user_id: @user_id,
        user_name: @user_name,
        user_screen_name: @user_screen_name,
        datetime: @datetime,
        tweet_id: tweet.id,
      )
    end
  end
end

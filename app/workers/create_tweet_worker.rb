class CreateTweetWorker
  include Sidekiq::Worker

  TWITTER_TOPIC = '#lol'

  def perform(tw_id, unformatted_text, user_id, user_name, user_screen_name, datetime)
    # Retweet example:
    # RT @SalamaChiroWS: We couldn't resist sharing! #LOL https://t.co/C5VYZ0w53a

    text = unformatted_text.gsub(/^RT @(.+?): /, '').gsub(/#{TWITTER_TOPIC}/i, '').strip
    text_hash = Digest::MD5.hexdigest(text)

    Tweet.create(
      tw_id: tw_id,
      user_id: user_id,
      user_name: user_name,
      user_screen_name: user_screen_name,
      text: text,
      text_hash: text_hash,
      datetime: datetime,
    )
  end
end

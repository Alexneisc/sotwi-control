class NewTweetWorker
  include Sidekiq::Worker

  def perform(twitter_id, unformatted_text, user_id, user_name, user_screen_name, datetime)
    NewTweet.new(
      twitter_id,
      unformatted_text,
      user_id,
      user_name,
      user_screen_name,
      datetime
    ).processing
  end
end

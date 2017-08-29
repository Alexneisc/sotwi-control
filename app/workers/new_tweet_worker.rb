class NewTweetWorker
  include Sidekiq::Worker

  def perform(tw_id, unformatted_text, user_id, user_name, user_screen_name, datetime)
    NewTweet.new(
      tw_id,
      unformatted_text,
      user_id,
      user_name,
      user_screen_name,
      datetime
    ).processing
  end
end

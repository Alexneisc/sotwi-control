class NewTweetWorker
  include Sidekiq::Worker

  def perform(collected_at, tweet_data={}, retweet_data={})
    NewTweet.new(collected_at, tweet_data, retweet_data).processing
  end
end

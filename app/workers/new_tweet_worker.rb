class NewTweetWorker
  include Sidekiq::Worker

  def perform(datetime, tweet_data={}, retweet_data={})
    NewTweet.new(datetime, tweet_data, retweet_data).processing
  end
end

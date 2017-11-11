namespace :clean_old do
  task tweets: :environment do
    CleanOldTweets.new.call
  end

  task retweets: :environment do
    CleanOldRetweets.new.call
  end
end

namespace :winner do
  task determination: :environment do
    WinnerDetermination.new.call
  end

  task retweet: :environment do
    WinnerRetweet.new.call
  end
end

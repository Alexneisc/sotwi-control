namespace :winner do
  task determination: :environment do
    WinnerDetermination.new(date = '07-10-2017').call
  end

  task retweet: :environment do
    WinnerRetweet.new(date = '07-10-2017').call
  end
end

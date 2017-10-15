class WinnerRetweet
  def initialize(date=nil)
    @date = date
  end

  def call
    date = win_date(@date)

    winner = Winner.find_by(date: date)

    if winner.present?
      tweet = winner.tweet
      # puts 'Yes!'
      # puts tweet.id
      TWITTER_CLIENT.retweet(tweet.id)
    end
  end

  private

  def win_date(date)
    if date.present?
      Date.parse(date).strftime('%Y-%m-%d')
    else
      Date.yesterday.strftime('%Y-%m-%d')
    end
  end
end

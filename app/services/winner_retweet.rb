class WinnerRetweet
  def initialize(date=nil)
    @date = date
  end

  def call
    date = win_date(@date)

    winners = Winner.where(date: date)

    if winners.present?
      winners.each do |winner|
        tweet = winner.tweet
        TWITTER_CLIENT.retweet(tweet.twitter_id)
        winner.update(retweeted_by_bot: true)
      end
    else
      if TELEGRAM_ON
        text = "Problem in WinnerRetweet 😞\n"
        text += "Don't have winner!\n"
        text += "win_date: #{date}\n"
        text += "Server time: #{Time.current}"
        TELEGRAM_BOT.api.send_message(chat_id: TELEGRAM_CHAT_ID, text: text)
      end

      raise Exception.new("Don't have winner!")
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

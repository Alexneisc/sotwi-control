class WinnerDetermination
  def initialize(date=nil)
    @date = date
  end

  def call
    date = win_date(@date)

    tags = Tweet.uniq_tags_for(date)

    tags.each do |tag|
      determinate(date, tag)
    end
  end

  private

  def determinate(date, tag)
    tweet = Tweet.
      for_date(date).
      where(collected_by_tag: tag).
      order(retweets_count: :desc).
      order(:id).
      first

    unless tweet.present?
      if TELEGRAM_ON
        text = "Problem in WinnerDetermination 😞\n"
        text += "Don't have winner!\n"
        text += "Tag: #{tag}\n"
        text += "win_date: #{date}\n"
        text += "Server time: #{Time.current}"
        TELEGRAM_BOT.api.send_message(chat_id: TELEGRAM_CHAT_ID, text: text)
      end

      raise Exception.new("Don't have winner!")
    end

    if Winner.where(date: date, tag: tag).any?
      if TELEGRAM_ON
        text = "Error in WinnerDetermination\n"
        text += "Already have a winner!\n"
        text += "tag: #{tag}\n"
        text += "win_date: #{date}\n"
        text += "Server time: #{Time.current}"
        TELEGRAM_BOT.api.send_message(chat_id: TELEGRAM_CHAT_ID, text: text)
      end

      raise Exception.new('Already have a winner!')
    end

    Winner.create(tweet_id: tweet.id, date: date, tag: tag)
  end

  def win_date(date)
    if date.present?
      Date.parse(date).strftime('%Y-%m-%d')
    else
      Date.yesterday.strftime('%Y-%m-%d')
    end
  end
end

class Tweet < ActiveRecord::Base
  TWITTER_TOPIC = '#lol'

  has_many :retweets

  scope :for_date, -> (date) {
    return if date.blank?
    where('datetime::date = ?', date)
  }
end

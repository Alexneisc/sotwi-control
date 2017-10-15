class Tweet < ApplicationRecord
  TWITTER_TOPIC = '#lol'

  has_many :retweets
  has_one :winner

  scope :for_date, -> (date) {
    return if date.blank?
    where('collected_at::date = ?', date)
  }
end

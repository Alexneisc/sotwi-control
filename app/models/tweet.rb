class Tweet < ActiveRecord::Base
  TWITTER_TOPIC = '#lol'

  has_many :replays
end

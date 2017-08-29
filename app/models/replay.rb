class Replay < ActiveRecord::Base
  belongs_to :tweet, counter_cache: true
end

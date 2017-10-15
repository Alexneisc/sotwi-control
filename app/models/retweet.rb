class Retweet < ApplicationRecord
  belongs_to :tweet, counter_cache: true

  scope :for_date, -> (date) {
    return if date.blank?
    where('collected_at::date = ?', date)
  }
end

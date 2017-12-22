class Tweet < ApplicationRecord
  has_many :retweets
  has_one :winner

  scope :for_date, -> (date) {
    return if date.blank?
    where('collected_at::date = ?', date)
  }

  scope :for_collected_tag, -> (tag) {
    return if tag.blank?
    where(collected_by_tag: tag)
  }

  def self.uniq_tags_for(date)
    for_date(date).distinct(:collected_by_tag).pluck(:collected_by_tag)
  end
end

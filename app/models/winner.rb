class Winner < ApplicationRecord
  belongs_to :tweet

  scope :for_date, -> (date) {
    return if date.blank?
    where('date = ?', date)
  }
end

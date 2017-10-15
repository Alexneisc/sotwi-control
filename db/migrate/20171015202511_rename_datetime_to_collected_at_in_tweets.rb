class RenameDatetimeToCollectedAtInTweets < ActiveRecord::Migration[5.1]
  def change
    rename_column :tweets, :datetime, :collected_at
  end
end

class RenameTwIdToTwitterIdInTweets < ActiveRecord::Migration[5.1]
  def change
    rename_column :tweets, :tw_id, :twitter_id
  end
end

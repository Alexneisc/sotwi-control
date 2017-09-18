class RenameTwIdToTwitterIdInReplays < ActiveRecord::Migration[5.1]
  def change
    rename_column :replays, :tw_id, :twitter_id
  end
end

class ChangeTweetsTweeterIdColumnType < ActiveRecord::Migration[5.1]
  def up
    change_column :tweets, :twitter_id, 'bigint USING CAST(twitter_id AS bigint)'
  end

  def down

  end
end

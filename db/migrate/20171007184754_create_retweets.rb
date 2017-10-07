class CreateRetweets < ActiveRecord::Migration[5.1]
  def change
    create_table :retweets do |t|
      t.bigint :twitter_id
      t.bigint :user_id
      t.string :user_name
      t.string :user_screen_name
      t.datetime :datetime
      t.bigint :tweet_id
    end

    rename_column :tweets, :replays_count, :retweets_count
  end
end

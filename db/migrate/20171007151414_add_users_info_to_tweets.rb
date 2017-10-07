class AddUsersInfoToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :user_id, :bigint
    add_column :tweets, :user_name, :string
    add_column :tweets, :user_screen_name, :string
    add_column :tweets, :twitter_created_at, :datetime
    add_column :tweets, :is_retweet, :boolean, default: false
  end
end

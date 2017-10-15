class AddCreatedAddToRetweets < ActiveRecord::Migration[5.1]
  def change
    add_column :retweets, :created_at, :datetime
    add_column :retweets, :twitter_created_at, :datetime
    rename_column :retweets, :datetime, :collected_at
  end
end

class AddIndexesToTweets < ActiveRecord::Migration[5.1]
  def change
    add_index :tweets, '(collected_at::date), collected_by_tag'
  end
end

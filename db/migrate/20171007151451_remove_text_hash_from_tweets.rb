class RemoveTextHashFromTweets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tweets, :text_hash, :string
  end
end

class AddTagsToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :collected_by_tag, :string
    add_column :tweets, :tags, :text, array: true, default: []
  end
end

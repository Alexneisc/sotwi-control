class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :tw_id
      t.string :user_id
      t.string :user_name
      t.string :user_screen_name
      t.string :text
      t.string :text_hash
      t.datetime :datetime, null: false

      t.datetime :created_at, null: false
    end
  end
end

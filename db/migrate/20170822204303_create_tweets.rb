class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :tw_id
      t.string :text
      t.string :text_hash
      t.datetime :datetime, null: false
      t.integer :replays_count, default: 0

      t.datetime :created_at, null: false
    end
  end
end

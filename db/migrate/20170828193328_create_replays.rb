class CreateReplays < ActiveRecord::Migration[5.1]
  def change
    create_table :replays do |t|
      t.string :tw_id
      t.string :user_id
      t.string :user_name
      t.string :user_screen_name
      t.datetime :datetime, null: false

      t.belongs_to :tweet
    end
  end
end

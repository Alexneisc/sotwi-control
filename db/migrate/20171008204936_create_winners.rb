class CreateWinners < ActiveRecord::Migration[5.1]
  def change
    create_table :winners do |t|
      t.bigint :tweet_id
      t.date :date

      t.datetime :created_at, null: false
    end
  end
end

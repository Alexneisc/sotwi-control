class AddRetweetedByBotToWinners < ActiveRecord::Migration[5.1]
  def change
    add_column :winners, :retweeted_by_bot, :boolean, default: false
  end
end

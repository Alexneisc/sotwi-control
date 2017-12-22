class AddTagToWinners < ActiveRecord::Migration[5.1]
  def change
    add_column :winners, :tag, :string
  end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email
      t.boolean :admin, default: false, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :remember_token, limit: 128, null: false
      t.string :roles, default: [], array: true

      t.timestamps
    end
  end
end

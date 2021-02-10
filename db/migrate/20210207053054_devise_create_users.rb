# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, null: false
      t.string :avatar_url
      t.string :github_url
      t.string :email, null: false, default: ""
      t.datetime :remember_created_at
      t.string :remember_token

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end

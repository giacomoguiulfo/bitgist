class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :description
      t.boolean :public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

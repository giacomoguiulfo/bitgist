class CreateGistFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :gist_files do |t|
      t.binary :gist_id, limit: 16, null: false, foreign_key: true
      t.string :language, default: "text/plain"
      t.string :filename
      t.text :content

      t.timestamps
    end
  end
end

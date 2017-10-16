class CreateAnswrs < ActiveRecord::Migration
  def change
    create_table :answrs do |t|
      t.string :text
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

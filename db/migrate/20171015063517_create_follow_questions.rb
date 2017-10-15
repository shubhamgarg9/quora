class CreateFollowQuestions < ActiveRecord::Migration
  def change
    create_table :follow_questions do |t|
      t.boolean :follow
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

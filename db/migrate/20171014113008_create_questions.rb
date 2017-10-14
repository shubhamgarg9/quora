class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :text
    	t.string :description
    	t.timestamps
    end
  end
end

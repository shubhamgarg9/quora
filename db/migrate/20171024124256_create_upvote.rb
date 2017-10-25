class CreateUpvote < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
    	t.boolean :upvote
    	t.references :user, index: true, foreign_key: true
      	t.references :answr, index: true, foreign_key: true
    end
  end
end

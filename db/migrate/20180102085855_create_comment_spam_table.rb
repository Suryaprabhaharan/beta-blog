class CreateCommentSpamTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_spams do |t|
    	t.integer :comment_id
    	t.integer :user_id
    end
  end
end

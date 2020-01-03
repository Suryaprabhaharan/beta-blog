class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    	t.integer :article_id
    	t.integer :user_id
    	t.string :user_name
    	t.string :description
    	t.timestamps
    end
  end
end

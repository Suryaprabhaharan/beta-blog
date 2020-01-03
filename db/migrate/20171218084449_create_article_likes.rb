class CreateArticleLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
    	t.integer :user_id
    	t.integer :article_id
    	t.boolean :status
    end
  end
end

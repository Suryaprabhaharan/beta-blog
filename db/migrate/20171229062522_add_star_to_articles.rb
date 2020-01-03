class AddStarToArticles < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :star, :boolean, default: false
  end
end

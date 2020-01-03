class AddFlaggedToComments < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :flagged, :boolean, default: false
  end
end

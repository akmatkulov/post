class AddPictureToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :picture, :string
  end
end

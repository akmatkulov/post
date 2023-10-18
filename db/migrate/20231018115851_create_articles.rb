class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end

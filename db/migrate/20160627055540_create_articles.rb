class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :user_id
      t.text :des

      t.timestamps null: false
    end
  end
end

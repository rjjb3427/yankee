class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user,:null=>false      
      t.string :title
      t.string :url
      t.timestamps
    end
    
    add_index :articles, :user_id
  end
end

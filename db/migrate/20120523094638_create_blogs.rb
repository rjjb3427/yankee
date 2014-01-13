# encoding: utf-8

class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.references :user, :null=>false      
      t.references :blog_category, :null=>false
      t.string :title, :null=>false, :limit=>60
      t.text :description, :null=>false
      t.string :photo
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps
    end
    
    create_table :blog_contents do |t|
      t.text :content,:null=>false
    end
    
    create_table :blog_comments do |t|
      t.references :blog,:null=>false      
      t.references :user
      t.string :name
      t.string :encrypted_password,:limit=>40
      t.string :salt      
      t.text :content,:null=>false
      t.timestamps
    end    
    
    add_index :blogs, :user_id    
    add_index :blogs, :blog_category_id
    add_index :blog_comments, :blog_id
    add_index :blog_comments, :user_id    
  end
end

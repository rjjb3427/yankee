# encoding: utf-8

class CreateGuestBooks < ActiveRecord::Migration
  def change
    create_table :guest_books do |t|
      t.string :title,:limit=>60,:null=>false
      t.string :name,:limit=>60,:null=>false
      t.string :password,:limit=>40,:null=>false
      t.integer :comment,:default=>0,:null=>false
      t.timestamps
    end
    
    create_table :guest_book_contents do |t|
      t.text :content,:null=>false
    end
    
    create_table :guest_book_comments do |t|
      t.references :guest_book,:null=>false
      t.string :name,:null=>false
      t.string :password,:null=>false
      t.text :content,:null=>false
      t.timestamps
    end   
    
    add_index :guest_book_comments, :guest_book_id
  end
end

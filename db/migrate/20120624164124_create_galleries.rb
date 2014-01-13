# encoding: utf-8

class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :gallery_categories do |t|
      t.string :title,:null=>false
      t.integer :galleries_count, :null=>false, :default=>0      
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end  
  
    create_table :galleries do |t|
      t.references :gallery_category,:null=>false
      t.string :title,:null=>false
      t.string :photo,:null=>false
      t.text :content,:null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
    
    add_index :galleries, :gallery_category_id
  end
end

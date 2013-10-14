# encoding: utf-8

class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title,:limit=>60,:null=>false
      t.string :name,:limit=>60,:null=>false
      t.string :password,:limit=>40,:null=>false
      t.integer :comment,:default=>0,:null=>false
      t.timestamps
    end
    
    create_table :question_contents do |t|
      t.text :content,:null=>false
    end
    
    create_table :question_comments do |t|
      t.references :question,:null=>false
      t.string :name,:null=>false
      t.string :password,:null=>false
      t.text :content,:null=>false
      t.timestamps
    end
    
    add_index :question_comments, :question_id 
  end  
end

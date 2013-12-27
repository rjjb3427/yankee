# encoding: utf-8

class CreateIntro < ActiveRecord::Migration
  def change
    create_table :intro do |t|
      t.string :title,:null=>false
      t.string :description,:null=>false      
      t.timestamps
    end
  end
end

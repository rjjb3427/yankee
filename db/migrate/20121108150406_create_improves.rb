# encoding: utf-8

class CreateImproves < ActiveRecord::Migration
  def change
    create_table :improves do |t|   
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end

# encoding: utf-8

class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, :limit=>60
      t.string :email
      t.string :phone, :limit=>40 
      t.string :title,:limit=>60,:null=>false
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps
    end
    
    create_table :contact_contents do |t|
      t.text :content, :null=>false
    end
  end
end

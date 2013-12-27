# encoding: utf-8

class CreateIntroPhotos < ActiveRecord::Migration
  def change
    create_table :intro_photos do |t|
      t.string :title,:limit=>60, :null=>false
      t.string :photo
      t.timestamps
    end
  end
end

# encoding: utf-8

class CreateProfilePhotos < ActiveRecord::Migration
  def change
    create_table :profile_photos do |t|
      t.string :title,:limit=>60, :null=>false
      t.string :photo
      t.timestamps
    end
  end
end

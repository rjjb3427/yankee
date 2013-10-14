class CreateGoodbyes < ActiveRecord::Migration
  def change
    create_table :goodbyes do |t|
      t.string :title

      t.timestamps
    end
  end
end

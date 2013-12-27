class CreateBlogCategories < ActiveRecord::Migration
  def change
    create_table :blog_categories do |t|
      t.references :blog_type, :null=>false      
      t.string :title, :null=>false, :limit=>60
      t.integer :blogs_count, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
    
    add_index :blog_categories, :blog_type_id    
  end
end

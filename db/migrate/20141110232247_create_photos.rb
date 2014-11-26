class CreatePhotos < ActiveRecord::Migration
    
  def change
    create_table :photos do |t|
      t.integer :post_id, limit: 3
    end
    
    add_attachment :photos, :image_file
  end

end

class AddConstraintToPhotos < ActiveRecord::Migration
  def up
    execute <<-SQL
      create unique index unique_header_photo on photos (post_id, header_photo) where header_photo is true;
    SQL
  end
  
  def down
    execute <<-SQL
      drop index unique_header_photo
    SQL
  end
end

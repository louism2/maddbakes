class AddHeaderImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :header_photo, :boolean, default: false
  end
end

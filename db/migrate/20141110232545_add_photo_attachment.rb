class AddPhotoAttachment < ActiveRecord::Migration
  def self.up
    add_attachment :photos, :image_file
  end
  
  def self.down
    remove_attachment :photos, :image_file
  end
end

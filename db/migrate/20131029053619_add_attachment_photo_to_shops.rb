class AddAttachmentPhotoToShops < ActiveRecord::Migration
  def self.up
    change_table :shops do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :shops, :photo
  end
end

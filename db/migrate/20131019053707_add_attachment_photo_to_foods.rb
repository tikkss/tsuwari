class AddAttachmentPhotoToFoods < ActiveRecord::Migration
  def self.up
    change_table :foods do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :foods, :photo
  end
end

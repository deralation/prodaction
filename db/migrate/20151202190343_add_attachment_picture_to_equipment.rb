class AddAttachmentPictureToEquipment < ActiveRecord::Migration
  def self.up
    change_table :equipment do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :equipment, :picture
  end
end

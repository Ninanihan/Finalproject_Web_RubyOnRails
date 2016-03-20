class AddAttachmentImageToBreeders < ActiveRecord::Migration
  def self.up
    change_table :breeders do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :breeders, :image
  end
end

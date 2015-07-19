class AddAttachmentImageToWines < ActiveRecord::Migration
  def self.up
    change_table :wines do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :wines, :image
  end
end

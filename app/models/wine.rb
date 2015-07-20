class Wine < ActiveRecord::Base
  def self.search(search)
  if search
    where(['name LIKE ?', "%#{search}%"])
  else
    all
  end
end

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_attached_file :image

  validates_attachment_content_type :image,
  content_type:  /^image\/(png|gif|jpeg)/,
  message: "Only images allowed"

  validates :image, attachment_presence: true
end

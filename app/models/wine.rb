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
  has_many :sales

  validates_attachment_content_type :image
  content_type:  /^image\/(png|gif|jpeg)/,
  message: "Only images allowed"

  validates :image, attachment_presence: true

  validates_numericality_of :price,
  greater_than: 49, message: "Must be at least 50 cents"

end

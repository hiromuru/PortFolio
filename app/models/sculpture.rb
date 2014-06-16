class Sculpture < ActiveRecord::Base
  has_many :images, as: :parent, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => :all_blank
  
  validates :title, :wide, :high, :images, :categoryno, :presence => true
  validates :wide, :high, :numericality => {:only_integer => true, :greater_than => 0}
  
  after_validation :cleanup_images
  
  def validate_number_of_images
    return unless self.images.size > 3
    self.errors.add(:images, "は3つまで添付できます")
  end
  
  def cleanup_images
    return unless self.errors.blank?
    self.images.each do |image|
      image.destroy if image._destroy
    end
  end
  
  
  
end

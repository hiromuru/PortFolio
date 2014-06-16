class Exhib < ActiveRecord::Base
  has_many :images, :as => :parent, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => :all_blank
  
end

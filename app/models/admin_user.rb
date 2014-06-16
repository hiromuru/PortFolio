class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
         
   has_one :image, as: :parent, :dependent => :destroy
   accepts_nested_attributes_for :image, :allow_destroy => true, :reject_if => :all_blank
   
   has_one :profile, :dependent => :destroy
   accepts_nested_attributes_for :profile, :allow_destroy => true, :reject_if => :all_blank
   
end

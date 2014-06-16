# coding: utf-8

ActiveAdmin.register Exhib do
  permit_params :title, :og, :discription, :start_at, :end_at, :adress, :images_attributes => [:image, :_destroy, :id, :parent, :parent_id, :parent_type, :parent_attributes ]  
  
  menu :priority => 2
  
  config.filters = false
  
  form do |f|
    f.inputs do
      f.has_many :images, :allow_destroy => true, :heading => '画像', :new_record => true, :require => true do |a|
          a.input :image, :as => :file, :label => false
      end
      f.input :title
      f.input :og, :as => :select, :collection => ["個展","グループ展"]
      f.input :discription
      f.input :adress
      f.input :start_at, :as => :datepicker
      f.input :end_at, :as => :datepicker
    end
    
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end

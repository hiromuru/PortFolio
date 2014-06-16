ActiveAdmin.register Profile do
  menu false
  
  permit_params :name, :history, :exhistory, :admin_user_id

  config.filters = false

  index :download_links => false do
    selectable_column
    column :name
    column :history  
    column :exhistory
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :history
      f.input :exhistory
      f.input :admin_user_id, :as => :hidden, :value => 1
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

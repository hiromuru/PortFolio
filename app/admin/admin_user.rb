ActiveAdmin.register AdminUser do
  menu :priority => 1
  permit_params :id, :email, :password, :password_confirmation, :images_attributes => [:image, :_destroy, :id, :parent, :parent_id, :parent_type, :parent_attributes ], :profile_attributes => [:name, :history, :exhistory, :_destroy]  
  config.filters = false
  config.paginate = false
  
  actions :all, :except => [:new, :destroy]
  
  index :download_links => false, :pagination_total => false, :as => :block do |au|
    div :for => au do
      table :id => "wrap" do
        thead do
          tr do
            th "email" 
            th "最終ログイン"
            th " "
          end
        end
        tbody do
          tr do
            td au.email
            td au.current_sign_in_at
            td link_to "adminedit", edit_admin_admin_user_path(au.id)
          end
        end
      end
      table do
        thead do
          tr do
            th "名前" 
            th "略歴"
            th "展示歴"
            th " "
          end
        end
        tbody do
          tr do
            td au.profile.name
            td au.profile.history
            td au.profile.exhistory
            td link_to "profileedit", edit_admin_profile_path(au.profile.id)
          end
        end
      end
    end
    #colums do 
    #  selectable_column
    #  id_column
    #  column :email
    #  column :current_sign_in_at
    #  column :sign_in_count
    #  actions
    #end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :image, :as => :file
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

# coding: utf-8

ActiveAdmin.register Sculpture do
  permit_params :title, :wide, :dipth, :high, :madedate, :categoryno, :body, :images_attributes => [:image, :_destroy, :id, :parent, :parent_id, :parent_type, :parent_attributes, :image_cache ]
  
  menu  :priority => 3
  config.clear_action_items!
  config.filters = false
  config.breadcrumb = false
  
  action_item :only => :index do 
    link_to "作品を登録する", new_admin_sculpture_path
  end
    
  
  controller do
    def edit
      title = Sculpture.find(params[:id]).title
      @page_title = "#{title}を編集する"
      @preview = 0 
    end
    def new
      @page_title = "作品登録"
      @sculpture = Sculpture.new
      @preview = 1
    end
  end
  
  show :title => :title do |sculpture|
    attributes_table do
      row :images do
        render :partial => "showimage", :locals => {:sculpture => sculpture}
      end
      row :title
      row :wide
      row :dipth
      row :sculpture
      row :madedate
      row :categoryno
    end
  end
  
  index :title => "作品", :download_links => false do
      selectable_column
      column :images do |sculpture|
        render :partial => "showimage", :locals => {:sculpture => sculpture}
      end
      column :title
      column "サイズ" do |sc|
        if sc.dipth?
          sc.wide.to_s + "×" + sc.dipth.to_s + "×" + sc.high.to_s
        else
          sc.wide.to_s + "×" + sc.high.to_s
        end
      end
      column :madedate
      column :categoryno 
      actions
  end 
  
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      (3 - f.object.images.size).times do
        f.object.images.build
      end 
      f.has_many :images, :allow_destroy => true, :heading => "作品画像", :new_record => false, :required => true do |a|
          a.input :image, :as => :file, :label => false, :hint => a.template.image_tag(a.object.image.thumb.url)
          a.input :image_cache, :as => :hidden
      end
      f.input :title, :required => true
      f.input :wide, :required => true
      f.input :dipth
      f.input :high, :required => true
      f.input :madedate, :as => :datepicker
      f.input :categoryno, :as => :select, :collection => ["1","2","3"], :required => true
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

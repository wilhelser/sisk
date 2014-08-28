ActiveAdmin.register CustomSite do

  permit_params :name, :url, :company_name, :city, :state, :zip_code, :primary_color, :secondary_color, :link_color, :link_color_hover, :club_name, :bank_website, :template, :account_number, :logo, :login_code

  # Index
  index do
    selectable_column
    column :id
    column :name
    column :club_name
    actions
  end

  # Form
  form do |f|
    f.inputs "Custom Site Details" do
      f.input :name
      f.input :url
      f.input :company_name
      f.input :city
      f.input :state
      f.input :zip_code, as: :string
      f.input :account_number
    end
    f.inputs "Site Design" do
      f.input :primary_color, input_html: { class: 'colorpicker' }
      f.input :secondary_color, input_html: { class: 'colorpicker' }
      f.input :link_color, input_html: { class: 'colorpicker' }
      f.input :link_color_hover, input_html: { class: 'colorpicker' }
      f.input :club_name
      f.input :bank_website
      f.input :login_code, as: :select, collection: Site.all
      f.input :template, :as => :select, :collection => ["template1", "template2", "template3"]
      f.inputs "Logo", :multipart => true do
        f.input :logo, :as => :file, :hint => f.template.image_tag(f.object.logo.url)
        f.input :logo_cache, :as => :hidden
      end
    end
    f.actions
  end

end

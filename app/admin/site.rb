ActiveAdmin.register Site do

  permit_params :name, :url, :site_code, :city, :state, :zip_code, :account_number, :logo, :primary_color, :secondary_color, :link_color, :link_color_hover, :club_name, :bank_website, :slug

  # Index
  index do
    selectable_column
    column :id
    column :name
    column :site_code
    actions
  end

  # Form
  form do |f|
    f.inputs "Custom Site Details" do
      f.input :name
      f.input :url
      f.input :site_code
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
      f.input :slug
      f.input :logo
    end
    f.actions
  end

end

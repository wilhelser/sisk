ActiveAdmin.register CustomSite do

  permit_params :name, :url, :company_name, :city, :state, :zip_code, :primary_color, :secondary_color, :link_color, :link_color_hover, :club_name, :bank_website, :template, :account_number, :logo

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
      f.input :logo
    end
    f.actions
  end

end

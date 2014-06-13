ActiveAdmin.register HomeSection do
  permit_params :title, :content, :link, :visible, site_ids: []
  # Index
  index do
    selectable_column
    column :id
    column :title
    actions
  end

  # Form
  form do |f|
    f.inputs "Section Details" do
      f.input :title
      f.input :content, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
      f.input :link
      f.input :visible
      f.input :site_ids, as: :check_boxes, collection: Site.all, label: "Show on Sites"
    end
    f.actions
  end

end

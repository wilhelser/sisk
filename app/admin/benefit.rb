ActiveAdmin.register Benefit do
  permit_params :title, :subtitle, :content, :link, category_ids: [:id], site_ids: [:id]
  # Index
  index do
    selectable_column
    column :id
    column :title
    actions
  end

  # Form
  form do |f|
    f.inputs "Benefit Details" do
      f.input :title
      f.input :subtitle
      f.input :content, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
      f.input :link
    end
    f.inputs "Categories" do
      f.input :category_ids, as: :check_boxes, collection: Category.all, label: "Categories"
      f.input :site_ids, as: :check_boxes, collection: Site.all, label: "Show on Sites"
    end
    f.actions
  end
end

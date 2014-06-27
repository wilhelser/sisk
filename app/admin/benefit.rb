ActiveAdmin.register Benefit do
  permit_params :title, :subtitle, :content, :link, :link_one_text, :link_two, :link_two_text, :link_three, :link_three_text, :position, :category_id, site_ids: []
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
      f.input :position, as: :select, collection: %w[1 2 3 4 5 6 7 8 9 10]
      f.input :content, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
      f.input :link
      f.input :link_one_text
      f.input :link_two
      f.input :link_two_text
      f.input :link_three
      f.input :link_three_text
    end
    f.inputs "Categories" do
      f.input :category_id, as: :select, collection: Category.all, label: "Categories"
      f.input :site_ids, as: :check_boxes, collection: Site.all, label: "Show on Sites"
    end
    f.actions
  end
end

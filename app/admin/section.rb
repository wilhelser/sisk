ActiveAdmin.register Section do
  permit_params :title, :content, :benefit_id, benefit_ids: []
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
    end
    f.input :benefit_id, as: :select, collection: Benefit.all
    f.input :benefit_ids, as: :check_boxes, collection: Benefit.all
    f.actions
  end
end

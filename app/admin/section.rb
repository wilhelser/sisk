ActiveAdmin.register Section do
  permit_params :title, :position, :content, :benefit_id, benefit_ids: []
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
      f.input :position, as: :select, collection: %w[1 2 3 4 5 6 7 8 9 10]
      f.input :content
    end
    f.input :benefit_ids, as: :check_boxes, collection: Benefit.all
    f.actions
  end
end

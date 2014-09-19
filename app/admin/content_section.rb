ActiveAdmin.register ContentSection do

  permit_params :intro_content, :health_content, :insurance_content, :savings_content, :security_content

  # Index
  index do
    selectable_column
    column :id
    actions
  end

  # Form
  form do |f|
    f.inputs "Content Section Details" do
      f.input :intro_content, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
      f.input :health_content, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
      f.input :insurance_content, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
      f.input :savings_content, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
      f.input :security_content, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
    end
    f.actions
  end
end


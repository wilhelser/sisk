class AddLinkFieldsToBenefits < ActiveRecord::Migration
  def change
    add_column :benefits, :link_one_text, :string
    add_column :benefits, :link_two, :string
    add_column :benefits, :link_two_text, :string
    add_column :benefits, :link_three, :string
    add_column :benefits, :link_three_text, :string
  end
end

class AddHeaderImageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :header_image, :string
  end
end

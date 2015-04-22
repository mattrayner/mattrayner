class AddLogosToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :svg_logo, :string, null: false
    add_column :skills, :image_logo, :string, null: false
  end
end

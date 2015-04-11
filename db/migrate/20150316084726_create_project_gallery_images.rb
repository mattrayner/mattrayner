class CreateProjectGalleryImages < ActiveRecord::Migration
  def change
    create_table :project_gallery_images do |t|
      t.integer :project_id
      t.string :title
      t.string :image

      t.timestamps null: false
    end
  end
end

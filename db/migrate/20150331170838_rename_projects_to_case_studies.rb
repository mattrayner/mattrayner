class RenameProjectsToCaseStudies < ActiveRecord::Migration
  def up
    rename_table :projects, :case_studies
    rename_table :project_gallery_images, :case_study_gallery_images
    rename_column :case_study_gallery_images, :project_id, :case_study_id
  end

  def down
    rename_column :case_study_gallery_images, :case_study_id, :project_id
    rename_table :case_study_gallery_images, :project_gallery_images
    rename_table :case_studies, :projects
  end
end

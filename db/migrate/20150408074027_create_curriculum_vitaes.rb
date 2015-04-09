class CreateCurriculumVitaes < ActiveRecord::Migration
  def change
    create_table :curriculum_vitaes do |t|
      t.text :note
      t.string :file

      t.timestamps null: false
    end
  end
end

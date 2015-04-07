class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title, null: false
      t.float :level, default: 0.0
      t.timestamps null: false
    end

    create_join_table :case_studies, :skills
  end
end

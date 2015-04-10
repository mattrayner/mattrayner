class CreateFitBitStats < ActiveRecord::Migration
  def change
    create_table :fit_bit_stats do |t|
      t.integer :steps, default: 0
      t.integer :floors, default: 0

      t.timestamps         null: false
    end
  end
end

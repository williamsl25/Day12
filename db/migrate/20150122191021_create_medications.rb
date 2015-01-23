class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.text :uses
      t.string :dosage
      t.text :side_effects

      t.timestamps null: false
    end
  end
end

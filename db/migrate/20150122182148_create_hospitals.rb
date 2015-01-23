class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end

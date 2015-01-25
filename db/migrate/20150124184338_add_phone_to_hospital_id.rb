class AddPhoneToHospitalId < ActiveRecord::Migration
  def change
    add_column :hospital, :phone, :string
  end

end

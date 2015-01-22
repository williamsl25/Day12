class ChangePatientsGenderToString < ActiveRecord::Migration
  def change
    change_column :patients, :gender, :string
  end
end

class AddDateOfBirthToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :date_of_birth :string
  end
end

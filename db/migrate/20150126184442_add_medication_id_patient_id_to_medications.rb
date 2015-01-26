class AddMedicationIdPatientIdToMedications < ActiveRecord::Migration
  def change
    add_column :medications, :medication_id, :integer
  end
end

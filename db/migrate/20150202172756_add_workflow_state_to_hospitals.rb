class AddWorkflowStateToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :workflow_state, :string
   
  end
end

class MedicationsController < ApplicationController


  def index
    @medications = Medication.all
    @patient = Patient.find params[:patient_id]
  end

  def show
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id]
    @medication = Medication.find params[:id]
    @patients = @medication.patients
  end

  def new
    @medication = Medication.new
    @patients = Patient.all 
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id]
    
  end

  def create
     @hospital = Hospital.find params[:hospital_id]
     @patient = Patient.find params[:patient_id]
     @medication = @patient.medications.new(medication_params)
      
      if @medication.save
        flash[:notice] = 'Medication was successfully perscribed.'
        redirect_to hospital_patient_path(@hospital, @patient) 
      else
        flash[:alert] = "Medication was NOT saved."
        render :new 
      end
    end
    
  def edit
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params [:id]
    
     
  end
# wrong num of arguments when I try to edit medication?

  def update
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params[:id]
    if @medication.update_attributes medication_params
      flash[:notice] = "Medication was successfully UPDATED."
      redirect_to hospital_patient_path(@hospital, @patient) 
    else
      flash[:alert] = "Medication was NOT updated."
      render :edit
    end
    
    # @medication.update medication_params
    # redirect_to medications_path
  end

  def destroy
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params[:id]
    @medication.delete
    redirect_to hospital_patient_path(@hospital, @patient)
  
  end

  private

  def medication_params
    params.require(:medication).permit(
      :name,
      :uses,
      :dosage,
      :side_effects,
      patient_ids: []
      )
  end

end
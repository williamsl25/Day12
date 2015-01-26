class MedicationsController < ApplicationController


  def index
    @medications = Medication.all
    @patient = Patient.find params[:patient_id]
  end

  def show
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id]
    @medication = Medication.find params[:id]
  end

  def new
    @medication = Medication.new
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id]
  end

  def create
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id]
    @medication = @patient.medications.new(medication_params)
      
      if @medication.save
        flash[:notice] = 'Medication was successfully perscribed.'
        redirect_to hospital_patient_path(@hospital, @patient) 
      else
        flash[:error] = "Medication was NOT saved."
        render :new 
      end
    end
    
    
  def edit
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params[:id]
  end

  def update
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params[:id]
    if @medication.update_attributes medication_params
      redirect_to hospital_patient_path(@hospital, @patient) 
    else
      render :edit
    end
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
      :side_effects
      )
  end

end
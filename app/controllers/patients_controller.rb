class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    @hospital = Hospital.find params[:hospital_id]
   
  end

  def show
    @patients = Patient.all
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
  end

  def new
    @patient = Patient.new
    @hospital = Hospital.find params[:hospital_id]
  end

  # def create
  #   @patient = Patient.create patient_params
  #   redirect_to patients_path

  # end

  def create
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.new(patient_params)
    
    if @patient.save
      flash[:notice] = 'Patient was successfully created.'
      redirect_to hospital_path(@hospital)
    else
      flash[:error] = "Patient was NOT saved."
      render :new
    end
  
  end

  def edit
    @hospital = Hospital.find params[:hospital_id]
  end

  def update
    @hospital = Hospital.find params[:hospital_id]
    if patient.update_attributes patient_params
      redirect_to hospitals_path
    else 
      render :new
    end
  end

  # def update
    # @patient = Patient.find params[:id]
    # @patient.update_attributes patient_params
    # redirect_to patients_path
  # end

  def destroy
    @hospital = Hospital.find params[:hospital_id]
    @patient.delete
    redirect_to hospitals_path
  end

  private 

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :date_of_birth,
      :gender,
      :description,
      :blood_type
    )
  end
end



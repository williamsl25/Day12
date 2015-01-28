class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    @hospital = Hospital.find params[:hospital_id]
   
  end

  def show
    @patients = Patient.all
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @medication = @patient.medications
    @doctor = @patient.doctors.new
  end

  def new
    @patient = Patient.new
    @hospital = Hospital.find params[:hospital_id]
    # added @medication = Medication.all 1/26 for join table
    @medications = Medication.all
  end

  def create
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.new(patient_params)
    # added @medication = Medication.all 1/26 for join table
    @medications = Medication.all

    if @patient.save
      flash[:notice] = "Patient was successfully created."
      redirect_to hospital_path(@hospital)
    else
      flash[:error] = "Patient was NOT saved."
      render :new
    end
  end
  def create_doctor
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.doctors.create doctor_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def delete_doctor
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:id]
    @doctor = @patient.doctors.find params[:doctor_id]
    @doctor.delete
    redirect_to hospital_patient_path(@hospital, @patient)
  end
    

  def edit
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    # added for join table
    @medications = Medication.all
  end

  def update
    # added for join table
    @medications = Medication.all
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    if @patient.update_attributes patient_params
      redirect_to hospital_patient_path(@hospital, @patient)
    else 
      render :new
    end
  end

  def destroy
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to hospital_patients_path(@hospital)
  end

  private
   
  def find_patient
    @patient = Patient.find params[:id]
  end

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :date_of_birth,
      :gender,
      :description,
      :blood_type,
      medication_ids: []
    )
  end

  def doctor_params
    params.require(:doctor).permit(:doctor_name)  
  end

end

# where do you put the .strftime(%M/%d/%Y) ?? to change the date format


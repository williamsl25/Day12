class PatientsController < ApplicationController
# list only what excepts an id
  before_action :set_patient, only: [
    :show,
    :edit,
    :update,
    :destroy,
    :wait,
    :checkup,
    :xray,
    :surgery,
    :pay,
    :leave
  ]

  def index
    @patients = Patient.all
    @hospital = Hospital.find params[:hospital_id]
  end

  def show
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @medications = if !params[:q].blank?
      @patient.medications.where("name LIKE ? OR uses LIKE ? OR dosage LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @patient.medications
    end
    @doctor = Doctor.new
    @doctors = @patient.doctors
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
      flash[:alert] = "Patient was NOT saved."
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
    @medications = @patient.medications
    
  end

  def update
    # added for join table
    @medications = Medication.all
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    if @patient.update_attributes patient_params
      flash[:notice] = "Patient was successfully UPDATED."
      redirect_to hospital_patient_path(@hospital, @patient)
    else 
      flash[:alert] = "Patient was NOT updated."
      render :edit
    end
  end

  def destroy
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to hospital_patients_path(@hospital)
  end

  def wait
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.wait!
    respond_to do |format|
      format.js
      format.html
    end
  end

  def checkup
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.checkup!
    respond_to do |format|
        format.js
        format.html
      end
  end

  def xray
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.xray!
    respond_to do |format|
        format.js
        format.html
      end
  end

  def surgery
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.surgery!
    respond_to do |format|
        format.js
        format.html
      end
  end

  def pay
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.pay!
    respond_to do |format|
        format.js
        format.html
      end

  end

  def leave
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @patient.leave!
    respond_to do |format|
        format.js
        format.html
      end
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
  def medication_params
    params.require(:medication).permit(
      :name,
      :uses,
      :dosage,
      :side_effects,
      patient_ids: []
      )
  
  end

  def doctor_params
    params.require(:doctor).permit(:doctor_name)  
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

end


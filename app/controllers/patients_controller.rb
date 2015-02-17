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
    @medications = if !params[:q].blank?
      Medication.where("name LIKE ? OR uses LIKE ? OR dosage LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      Medication.all
    end
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
    @medications = Medication.all
    @medication = Medication.find params[:id]
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
    @patient.wait!
    respond_to do |format|
      format.js
      format.html
    end
  end

  def checkup
    @patient.checkup!
    respond_to do |format|
        format.js
        format.html
      end
  end

  def xray
    @patient.xray!
    respond_to do |format|
        format.js
        format.html
      end
  end

  def surgery
    @patient.surgery!
    respond_to do |format|
        format.js
        format.html
      end
  end

  def pay
    @patient.paybill!
    redirect_to hospital_patients_path
  end

  def leave
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


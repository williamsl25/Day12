class HospitalsController < ApplicationController
  # before_action :set_hospital, only: [:show, :edit, :update, :destroy]
  def index
    @hospitals = if !params[:q].blank?
      Hospital.where("name LIKE ? OR address LIKE ? OR city LIKE ? OR state LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @hospitals = Hospital.all
    end
  end

  
  def show
    @hospital = Hospital.find params[:id]
    @patients = if !params[:q].blank?
      @hospital.patients.where("first_name LIKE ? OR last_name LIKE ? OR date_of_birth LIKE ? OR description LIKE ? OR gender LIKE ? OR blood_type LIKE ? OR workflow_state LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @hospital.patients
    end
    @doctor = @hospital.doctors.new
  end


  def new
    @hospital = Hospital.new
  end

  # def create
  #   @hospital = Hospital.create hospital_params
  #   redirect_to hospitals_path
  # end

  def create
    @hospital = Hospital.create hospital_params
    if @hospital.save
      flash[:notice] = 'Hospital was successfully created'
      redirect_to @hospital
    else
      flash[:alert] = "Hospital was NOT saved"
      render :new
    end
  end

  def create_doctor
    @hospital = Hospital.find params[:id]
    @hospital.doctors.create doctor_params
    redirect_to hospital_path(@hospital)
  end

  def delete_doctor
    @hospital = Hospital.find params[:id]
    @doctor = Doctor.find params[:doctor_id]
    @doctor.delete
    redirect_to hospital_path
  end

  def edit
    @hospital = Hospital.find params[:id]
  end

  def update
    @hospital = Hospital.find params[:id]
    @hospital.update_attributes hospital_params
    if @hospital.update_attributes hospital_params
      flash[:notice] = "Patient was successfully UPDATED."
      redirect_to hospitals_path
    else
      flash[:alert] = "Patient was NOT updated."
      render :edit
    end

  end

  def destroy
    @hospital = Hospital.find params[:id]
    @hospital.delete
    redirect_to hospitals_path
  end

  private

  def hospital_params
    params.require(:hospital).permit(
      :name,
      :address,
      :city,
      :state,
      :zip,
      :phone
      )
  end
  
  def find_patient
    @patient = Patient.find params[:id]
  end

  def doctor_params
    params.require(:doctor).permit(:doctor_name)
  end
end


  


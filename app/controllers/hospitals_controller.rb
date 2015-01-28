class HospitalsController < ApplicationController
  # before_action :set_hospital, only: [:show, :edit, :update, :destroy]
  def index
    @hospitals = Hospital.all
  end

  def show
    @hospital = Hospital.find params[:id]
    @patients = @hospital.patients
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
      flash[:error] = "Hospital was NOT saved"
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
    redirect_to hospitals_path
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

  def doctor_params
    params.require(:doctor).permit(:doctor_name)
  end
end


  


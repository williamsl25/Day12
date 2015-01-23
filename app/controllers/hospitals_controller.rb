class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]
  
  def index
    @hospitals = Hospital.all
  end

  def show
    @patients = @hospital.patients
  end

  # def new
  #   @hospital = Hospital.new
  # end

  # def edit
  # end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      flash[:notice] = 'Hospital was successfully created'
      redirect_to hospitals_path
    else
      flash[:error] = "Hospital was NOT saved"
      render :new
    end
  end

  # def update
  # end

  # def destroy
  #   @hospital = Hospital.find params[:id]
  #   @hospital.delete
  #   redirect_to hospitals_path
  # end

  private
  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(
      :name,
      :description,
      :address,
      :city,
      :state,
      :zip
      )
  end


end
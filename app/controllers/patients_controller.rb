class PatientsController < ApplicationController
  def index
    @patients = Patient.all

  end

  def new
    @patient = Patient.new
  
  end

  # def create
  #   @patient = Patient.create patient_params
  #   redirect_to patients_path

  # end

def create
    @patient = Patient.new(patient_params)
    # flash
    if @patient.save
      flash[:notice] = 'Patient was successfully created.'
      redirect_to patients_path
    else
      flash[:error] = 'Patient was NOT saved.'
      render :new
    end
  end


  def edit
    @patient = Patient.find params[:id]

  end

  def update
    @patient = Patient.find params[:id]
    @patient.update_attributes patient_params
    redirect_to patients_path

  end

  def destroy
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to patients_path
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



class WelcomeController < ApplicationController
  def index
    # @hospitals = Hospital.all
    @patients = Patient.all
  end
end

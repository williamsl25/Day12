class WelcomeController < ApplicationController
  def index
    @hospitals = Hospital.all
  end
end

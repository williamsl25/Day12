class Patient < ActiveRecord::Base

  belongs_to :hospital
  # has_many :medications, dependent: :destroy
  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_many :doctors, as: :doctorable

  BLOOD_TYPE_OPTIONS= [
    ["A", "a"],
    ["A-", "a-"],
    ["A+", "a+"],
    ["B", "b"],
    ["B-", "b-"],
    ["B+", "b+"],
    ["AB", "ab"],
    ["AB-", "ab-"],
    ["AB+", "ab+"],
    ["O", "o"],
    ["O+", "o+"],
    ["O-", "o-"],
  ]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :description, presence: true
  validates :blood_type, presence: true
  validate :at_least_10

  def at_least_10
    if self.date_of_birth
      errors.add(:date_of_birth, ':You must be at least 10 years or older') if self.date_of_birth > 10.years.ago.to_date
     
    end
  end
  
  include Workflow
    workflow do 
      state :waiting do
        event :checkup, transitions_to: :checkup
        event :xray, transitions_to: :xray
        event :surgery, transitions_to: :surgery
        event :leave, transitions_to: :leaving 
      end
      state :checkup do
        event :wait, transitions_to: :waiting
        event :xray, transitions_to: :xray
        event :surgery, transitions_to: :surgery
        event :pay, transitions_to: :paying
      end
      state :xray do
        event :wait, transitions_to: :waiting
        event :checkup, transitions_to: :checkup
        event :surgery, transitions_to: :surgery
        event :pay, transitions_to: :paying
      end
      state :surgery do
        event :wait, transitions_to: :waiting
        event :xray, transitions_to: :xray
        event :checkup, transitions_to: :checkup
        event :pay, transitions_to: :paying
      end
      state :paying do
        event :leave, transitions_to: :leaving
      end

      state :leaving 
      
    end
end

  

  

   


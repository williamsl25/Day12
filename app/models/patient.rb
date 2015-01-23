class Patient < ActiveRecord::Base

  belongs_to :hospital
  has_many :medication

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
  
end

  

  

   


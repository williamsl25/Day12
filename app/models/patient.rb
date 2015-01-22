class Patient < ActiveRecord::Base
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
  
# how do you add a validates for patients to be 10 yrs or older?
  
end

   


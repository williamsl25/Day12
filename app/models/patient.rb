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
end


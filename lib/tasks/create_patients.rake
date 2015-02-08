task create_patients: :environment do 
  10.times do
    Patient.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      date_of_birth: Faker::Date.between(75.years.ago, Date.today),
      description: Faker::Lorem.sentence,
      
      })
  
end
puts "10 patients created"
end
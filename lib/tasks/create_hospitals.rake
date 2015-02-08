task create_hospitals: :environment do 
  10.times do
    Hospital.create!({
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip: Faker::Address.zip,
      
      
      })
  
end
puts "10 Hospitals created"
end


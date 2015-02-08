task create_medications: :environment  do
  10.times do
    Medication.create!({
      name: Faker::Name.name,
      uses: Faker::Lorem.sentence,

    })

  end
puts "10 medications created.  All have been set to user_id 1 which should correspond to the first user id you create."
end
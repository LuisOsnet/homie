# frozen_string_literal: false

namespace :create do
  desc 'Seed data for rented properties'
  task rented_roperties: :environment do
    Property.find_or_create_by(
      name: Faker::Company.name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      status: 1,
      owner_name: Faker::Name.name,
      owner_phone: Faker::PhoneNumber.phone_number_with_country_code
    )
  end
end
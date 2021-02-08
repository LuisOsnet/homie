# frozen_string_literal: false

namespace :create do
  desc 'Seed data for removed properties'
  task removed_roperties: :environment do
    Property.find_or_create_by(
      name: Faker::Company.name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      status: 2,
      owner_name: Faker::Name.name,
      owner_phone: Faker::PhoneNumber.phone_number_with_country_code
    )
  end
end
# frozen_string_literal: true

# == Schema Information
#
# Table name: properties
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  owner_name  :string
#  owner_phone :string
#  price       :decimal(10, 2)
#  status      :integer          default("published")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :property do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    status { 0 }
    owner_name { Faker::Name.name }
    owner_phone { Faker::PhoneNumber.phone_number_with_country_code }
  end

  factory :published_properties, class: 'Property' do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    status { 0 }
    owner_name { Faker::Name.name }
    owner_phone { Faker::PhoneNumber.phone_number_with_country_code }
  end

  factory :rented_roperties, class: 'Property' do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    status { 1 }
    owner_name { Faker::Name.name }
    owner_phone { Faker::PhoneNumber.phone_number_with_country_code }
  end

  factory :removed_roperties, class: 'Property' do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    status { 2 }
    owner_name { Faker::Name.name }
    owner_phone { Faker::PhoneNumber.phone_number_with_country_code }
  end
end

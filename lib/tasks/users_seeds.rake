# frozen_string_literal: false

namespace :create do
  desc 'Seed data for users'
  task users: :environment do
    admin = User.create(
      name: Faker::Name.name,
      email: 'admin@example.com',
      password: 'valid_password',
      password_confirmation: 'valid_password'
    )

    admin.remove_role(:visitor)
    admin.add_role(:admin)

    partner = User.create(
      name: Faker::Name.name,
      email: 'partner@example.com',
      password: 'valid_password',
      password_confirmation: 'valid_password'
    )

    partner.remove_role(:visitor)
    partner.add_role(:partner)

    visitor = User.create(
      name: Faker::Name.name,
      email: 'visitor@example.com',
      password: 'valid_password',
      password_confirmation: 'valid_password'
    )
  end
end

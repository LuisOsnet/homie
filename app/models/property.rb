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
class Property < ApplicationRecord
  enum status: %i[published rented removed]

  scope :status, ->(value) { where(status: value) }
end

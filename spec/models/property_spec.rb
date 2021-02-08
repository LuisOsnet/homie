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
require 'rails_helper'

RSpec.describe Property, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

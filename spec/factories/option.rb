# frozen_string_literal: true

FactoryBot.define do
  factory :option do
    option_type { 'COLOR' }
    option_value { 'red' }
  end
end

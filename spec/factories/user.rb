require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider 'github'
    nickname 'simlegate'
  end
end

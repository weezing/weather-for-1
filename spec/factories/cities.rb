FactoryBot.define do
  factory :city do
    name { 'Warsaw' }
    latitude { 52.23 }
    longitude { 21.01 }
    user
  end
end

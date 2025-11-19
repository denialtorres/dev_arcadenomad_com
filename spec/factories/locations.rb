FactoryBot.define do
  factory :location do
    name { "Pizza Works" }
    description { "A fantastic pizza place with arcade games and great atmosphere for families" }
    street { "123 Main Street" }
    city { "Columbus" }
    state { "OH" }
    zip { "43215-1234" }
    telephone { "(614) 555-0123" }
    rating { 4.5 }
  end
end

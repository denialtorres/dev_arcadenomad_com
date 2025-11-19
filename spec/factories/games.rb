FactoryBot.define do
  factory :game do
    name { "Pac-Man" }
    description { "A classic arcade game where you navigate a maze eating dots while avoiding ghosts." }
    release_date { 1980 }
  end
end

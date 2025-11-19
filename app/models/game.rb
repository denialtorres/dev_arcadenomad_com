class Game < ApplicationRecord
  validates :release_date,
              numericality: {
                  only_integer: true,
                  greater_than_or_equal_to: 1970,
                  less_than_or_equal_to: 1989,
                  message: "The release date must be between 1970 and 1989."
              }
end

class Location < ApplicationRecord
  # the setter is just a standar ruby instance method, but it must
  # be assigned the same name as the model data whose setter you did
  # like to override
  def telephone=(value)
    write_attribute(:telephone, value.gsub(/[^0-9]/i, ""))
  end

  def address
    street + " " + city + ", " + state + " " + zip
  end
end

class Location < ApplicationRecord
  after_create :log_location

  # the setter is just a standard ruby instance method, but it must
  # be assigned the same name as the model data whose setter you did
  # like to override
  def telephone=(value)
    write_attribute(:telephone, value.gsub(/[^0-9]/i, ""))
  end

  def address
    street + " " + city + ", " + state + " " + zip
  end

  private

  def log_location
    logger.info "New location #{id} - #{name} created"
  end
end

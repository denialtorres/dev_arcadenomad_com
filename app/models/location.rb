class Location < ApplicationRecord
  after_create :log_location
  before_validation :normalize_telephone

  # override the destroy method behaviour, to get a soft delete feature
  before_destroy :override_delete

  # the setter is just a standard ruby instance method, but it must
  # be assigned the same name as the model data whose setter you did
  # like to override
  # def telephone=(value)
  #   write_attribute(:telephone, value.gsub(/[^0-9]/i, ""))
  # end

  def address
    street + " " + city + ", " + state + " " + zip
  end

  private

  def log_location
    logger.info "New location #{id} - #{name} created"
  end

  def normalize_telephone
    self.telephone = telephone&.gsub(/[^0-9]/i, "")
  end

  def override_delete
    update_attribute(:deleted_at, Time.now)
    # we return false to ensure the record is never actually deleted
    false
  end
end

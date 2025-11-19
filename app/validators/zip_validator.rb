class ZipValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\b[0-9]{5}-[0-9]{4}\b/
      record.errors.add(attribute, options[:message] || "is not a valid ZIP+4 zip code.")
    end
  end
end

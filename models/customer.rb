class Customer
  APPROVED_FIELDS = %i(email fname lname gender date_of_birth favorite_color)
  attr_accessor *APPROVED_FIELDS

  def initialize(attrs)
    raise EmailRequiredForCustomer unless attrs[:email]
    @raw_attrs = attrs
    @customer_data = instantiate_fields
  end

  private

  def instantiate_fields
    drop_unapproved_fields.each { |name, value| instance_variable_set("@#{name}", value) }
  end

  def drop_unapproved_fields
    @raw_attrs.select { |key| APPROVED_FIELDS.include? key }
  end
end

class EmailRequiredForCustomer < StandardError; end

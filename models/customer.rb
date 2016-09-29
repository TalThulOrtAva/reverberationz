class Customer
  APPROVED_FIELDS = %i(fname lname gender date_of_birth favorite_color)
  attr_accessor *APPROVED_FIELDS

  def initialize(attrs)
    customer_data = drop_unapproved_fields(attrs)
    instantiate_fields(customer_data)
  end

  def instantiate_fields(customer_data)
    customer_data.each { |name, value| instance_variable_set("@#{name}", value) }
  end

  def drop_unapproved_fields(attrs)
    attrs.select { |key| APPROVED_FIELDS.include? key }
  end

  # lambdas to pass for sorting, to avoid a collective class (not generally a fan unless it's an attribute of another object)
  # not really sold on whether they should be static or not
  def self.gender_sort_method
    lambda { |a,b| [a.gender.downcase, a.lname.downcase] <=> [b.gender.downcase, a.lname.downcase] }
  end

  def self.dob_sort_method
    lambda { |a,b| a.date_of_birth <=> b.date_of_birth }
  end

  def self.lname_sort_method
    lambda { |a,b| b.lname.downcase <=> a.lname.downcase }
  end
end

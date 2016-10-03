require 'json'
require 'date'
require 'faker'

class Customer
  APPROVED_FIELDS = %i(email fname lname gender date_of_birth favorite_color)
  attr_accessor *APPROVED_FIELDS

  def initialize(attrs)
    raise EmailRequiredForCustomer unless attrs[:email]
    @raw_attrs = attrs
    @customer_data = instantiate_fields
  end

  def to_h
    APPROVED_FIELDS.each_with_object({}) { |field, hash| hash[field] = self.send(field) }
  end

  def json
    to_h.to_json
  end

  # convenience for irb/pry testing
  def self.generate_random
    raw_attrs = APPROVED_FIELDS.each_with_object({}) { |field, hash|
      case field
        when :date_of_birth
          hash[field] = Date.today-rand(10000)
        when :email
          hash[field] = Faker::Internet.email
        else
          hash[field] = ('a'..'z').to_a.shuffle[0, 8].join
      end
    }
    Customer.new(raw_attrs)
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

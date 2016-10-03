require_relative 'db_accessor'

class Customers
  attr_accessor :all

  def initialize
    @db = DBAccessor.new
    refresh!
  end

  def refresh!
    @all = DBAccessor.new.get_customers || []
  end

  def sort(criteria)
    case criteria
    when 'gender'
      by_gender
    when 'lname'
      by_lname
    when 'dob'
      by_dob
    else
      to_h
    end
  end

  def add(customer)
    @db.add_customer(customer)
  end

  # not used
  def update(customer)
    @db.update_customer(customer)
  end

  def to_h
    refresh!
    @all.map { |customer| customer.to_h }
  end

  def self.find(email)
    DBAccessor.new.get_customer(email)
  end

  private

  # TODO create spec for Customers, add these from customer_spec
  def by_gender
    to_h.sort_by{ |customer| [customer[:gender], customer[:lname] ] }
  end

  def by_dob
    to_h.sort_by{ |customer| customer[:date_of_birth] }
  end

  def by_lname
    to_h.sort_by{ |customer| customer[:lname] }.reverse! # benchmark showed this as the fastest option, although that isn't intuitive
  end
end

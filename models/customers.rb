require_relative 'db_accessor'

class Customers
  attr_accessor :all

  def initialize(customers = [])
    @db = DBAccessor.new
    @all = customers
  end

  def refresh!
    @all = DBAccessor.new.customers_hash || []
  end

  # TODO create spec for Customers, add these from customer_spec
  def by_gender
    @all.sort_by{ |customer| [customer.gender, customer.lname] }
  end

  def by_dob
    @all.sort_by(&:date_of_birth)
  end

  def by_lname
    @all.sort_by(&:lname).reverse! # benchmark showed this as the fastest option, although that isn't intuitive
  end

  def add(customer)
    @db.add_customer(customer)
  end

  def update(customer)
    @db.update_customer(customer)
  end
end

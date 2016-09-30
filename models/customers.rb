require_relative 'db_accessor'

class Customers
  def initialize(customers = [])
    @db = DBAccessor.new
    @customers = customers
    refresh! if customers.empty?
  end

  def refresh!
    @customers = DBAccessor.new.get_all_customers
  end

  def by_gender
    @customers.sort_by{ |customer| [customer.gender, customer.lname] }
  end

  def by_dob
    @customers.sort_by(&:date_of_birth)
  end

  def by_lname
    @customers.sort_by(&:lname).reverse!
  end

  def add(customer)
    @db.set_customer(customer)
  end
end

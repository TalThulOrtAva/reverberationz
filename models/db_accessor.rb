require 'os'
require 'json'
require 'active_support/all'

class DBAccessor
  def initialize(path = 'db/customers.json')
    @path = path
  end

  def get_customer(email)
    cust_data = customer_hash(email)
    cust_data ? Customer.new(cust_data) : nil
  end

  def get_customers
    cust_data = customers_hash
    cust_data ? cust_data.map{ |customer| Customer.new(customer) } : []
  end

  def add_customer(customer)
    raise NotUniqueError if customer_hash(customer.email)
    update_customers_file(customers_hash << customer.to_h)
  end

  # not used... yet
  def update_customer(customer)
    existing = customer_hash(customer.email)
    raise CustomerDoesNotExist unless existing
    expire_customer(existing[:email])

    updated_file = customers_hash << customer.to_h
    update_customers_file(updated_file)
  end

  def expire_customer(email)
    updated_file = customers_hash.reject { |customer| customer[:email] == email }
    update_customers_file(updated_file)
  end

  def flush_all # (lazy prod protection just to show it was a concern)
    update_customers_file([]) if OS.osx? || OS.windows?
  end

  private

  def customer_hash(email)
    customers_hash.detect { |customer| customer[:email] == email } || nil
  end

  def customers_hash
    JSON.parse(File.read(@path)).map { |customer| customer.symbolize_keys! } || []
  end

  def customer_array(hash)
    hash.map { |customer| Customer.new(customer) }
  end

  def update_customers_file(customers_hash)
    File.open(@path, 'wb') { |f| f.write(customers_hash.to_json) }
  end
end

class NotUniqueError < StandardError; end
class CustomerDoesNotExist < StandardError; end


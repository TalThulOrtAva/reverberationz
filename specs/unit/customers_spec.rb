require File.dirname(__FILE__) + '/spec_helper'

describe Customers do
  before(:all) do
    DBAccessor.new.flush_all
    test_data = [].tap { |cust_data| 5.times { cust_data << Customer.generate_random } }
    customers = Customers.new
    test_data.each{ |customer| customers.add(customer)}
  end
  let(:customers) { Customers.new() }

  describe '#to_h' do
    it 'converts all customers into an array of hashes' do
      cust_hash = customers.to_h
      expect(cust_hash.count).to eq(5)
      expect(cust_hash[0]).to be_a Hash
    end
  end

  describe '#find' do
    it 'finds a customer from the db' do
      new_cust = Customer.new(customers.to_h[0])
      expect(Customers.find(new_cust.email).to_h).to eq(new_cust.to_h)
    end
  end

  describe '#add' do
    it 'adds a customer to the database' do
      new_cust = Customer.generate_random
      customers.add(new_cust)
      expect(Customers.find(new_cust.email).to_h).to eq(new_cust.to_h)
    end
  end

  describe '#refresh!' do
    it 'reloads the db state' do
      DBAccessor.new.flush_all
      test_data = [].tap { |cust_data| 5.times { cust_data << Customer.generate_random } }
      customers = Customers.new
      test_data.each{ |customer| customers.add(customer)}
      expect(customers.all.count).to eq(0)
      customers.refresh!
      expect(customers.all.count).to eq(5)
    end
  end
end

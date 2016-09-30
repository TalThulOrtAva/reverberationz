require 'rspec'
require_relative '../../api/reverb'

describe 'csv to redis' do

  it 'should import csv files to the redis db' do
    db = DBAccessor.new
    parsed = CSVParser.new('specs/fixtures/comma_data.csv', ',')
    parsed.customers.each { |customer| db.add_customer(customer) }
    customers_from_db = db.get_all_customers
    expect(customers_from_db.count).to eq(2)
    expect(customers_from_db[0]).to be_a Customer
    expect(customers_from_db[1]).to be_a Customer
    expect(customers_from_db.select{ |customer| customer.fname == 'Sandi'}.count).to eq 1
  end

  context 'should serve redis entries via api' do
    it 'should serve customers ordered by gender, then lname' do

    end

    it 'should serve customers ordered by lname, desc' do

    end

    it 'should serve customers ordered by date of birth' do

    end

    it 'should POST a new customer to the db' do

    end
  end
end

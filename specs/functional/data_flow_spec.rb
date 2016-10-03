require_relative  'spec_helper'

describe 'csv to redis' do
  it 'should import csv files to the json db file' do
    db = DBAccessor.new
    parsed = CustomerFileParser.new('specs/fixtures/comma_data.csv', ',')
    parsed.customers.each { |customer| db.add_customer(customer) }
    customers_from_db = db.get_customers
    expect(customers_from_db.count).to eq(2)
    expect(customers_from_db[0]).to be_a Customer
    expect(customers_from_db[1]).to be_a Customer
    expect(customers_from_db.select{ |customer| customer.fname == 'Sandi'}.count).to eq 1
  end
end

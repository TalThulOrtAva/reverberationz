require 'rspec'

describe 'csv to redis' do

  it 'should import csv files to the redis db' do
    db = DbAccessor.new
    parsed = CsvParser.new('specs/fixtures/comma_data.csv', ',')
    parsed.customers.each { |customer| db.set_customer(customer) }
    customers_from_db = db.get_all_customers
    expect(customers_from_db.count).to eq(2)
    expect(customers_from_db[0]).to be_a Customer
    expect(customers_from_db[1]).to be_a Customer
    expect(customers_from_db.select{ |customer| customer.fname == 'Sandi'}.count).to eq 1
  end

  it 'should serve redis entries via api' do

  end
end

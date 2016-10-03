require_relative 'spec_helper'

describe Reverb::API do
  include Rack::Test::Methods

  def app
    Reverb::API
  end

  before(:all) do
    test_data = [].tap { |cust_data| 5.times { cust_data << Customer.generate_random } }
    customers = Customers.new
    test_data.each{ |customer| customers.add(customer)}
  end
  after(:all)   { DBAccessor.new.flush_all }

  let(:customers) { Customers.new() }

  it 'should serve all customers' do
    get '/api/customers/'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body, symbolize_names: true)).to eq(customers.to_h)
  end

  it 'should serve customers ordered by gender, then lname' do
    get '/api/customers?sort=gender'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body, symbolize_names: true)).to eq(customers.sort('gender'))
  end

  it 'should serve customers ordered by lname, desc' do
    get '/api/customers?sort=lname'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body, symbolize_names: true)).to eq(customers.sort('lname'))
  end

  it 'should serve customers ordered by date of birth' do
    get '/api/customers?sort=dob'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body, symbolize_names: true)).to eq(customers.sort('dob'))
  end

  it 'should POST a new customer to the db' do
    customer = Customer.generate_random
    customer_json = customer.json
    post '/api/customers', { customer: customer_json }, 'Content-Type' => 'application/json'
    expect(last_response.status).to eq(201)
  end
end

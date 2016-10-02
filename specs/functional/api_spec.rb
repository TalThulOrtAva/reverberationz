require_relative 'spec_helper'

describe Reverb::API do
  include Rack::Test::Methods

  def app
    Reverb::API
  end

  before(:all){ }
  it 'should serve customers ordered by gender, then lname' do
    get '/customers/?sort=gender'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq({ ping: 'pong' }.to_json)
  end

  it 'should serve customers ordered by lname, desc' do
    get '/customers/?sort=lname'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq({ ping: 'pong' }.to_json)
  end

  it 'should serve customers ordered by date of birth' do
    get '/customers/?sort=gender'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq({ ping: 'pong' }.to_json)
  end

  it 'should POST a new customer to the db' do
    customer = Customer.generate_random
    post '/customers/', 'customer' => customer
    expect(last_response.status).to eq(201)
  end
end

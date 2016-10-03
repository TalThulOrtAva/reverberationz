require File.dirname(__FILE__) + '/spec_helper'

describe Customer do
  let(:attributes1) { { email: 'ghosts@arereal.com',    lname: 'Eeeeia', fname: 'Sandi', gender: 'Female', favorite_color: 'blue', date_of_birth: Date.today - 25.years } }
  let(:attributes2) { { email: 'themovie@iceage.net',   lname: 'Ddddra', fname: 'Kathy', gender: 'Female', favorite_color: 'Grey', date_of_birth: Date.today - 30.years, nonsense: 4 } }
  let(:attributes3) { { email: 'theevent@iceage.gov',   lname: 'Ccccuy', fname: 'Some', gender: 'Male', favorite_color: 'gray', date_of_birth: Date.today - 5.years }}
  let(:attributes4) { { email: 'ghosts@arenotreal.edu', lname: 'Bbbbia', fname: 'DestroyerOfWorlds', gender: 'Female', favorite_color: 'Marigold', date_of_birth: Date.today - 15.years }}
  let(:attributes5) { { email: 'bestsinger@liar.au',    lname: 'Aaaava', fname: 'FlowerEater', gender: 'Female', favorite_color: 'TICKLE ME PINK', date_of_birth: Date.today }}

  let(:customer1) { Customer.new(attributes1) }
  let(:customer2) { Customer.new(attributes2) }
  let(:customer3) { Customer.new(attributes3) }
  let(:customer4) { Customer.new(attributes4) }
  let(:customer5) { Customer.new(attributes5) }

  describe '#new' do
    it 'maps attributes accurately' do
      attributes1.each { |attr| expect(attr[1]).to eq customer1.send(attr[0]) }
    end

    it 'does not break when given extraneous data' do
      expect(customer2.gender).to eq attributes2[:gender]
    end

    it 'does not expose extraneous data dynamically' do
      expect { customer2.nonsense }.to raise_error NoMethodError
    end

    it 'should not create a record without an email address' do
      expect { Customer.new({}) }.to raise_error EmailRequiredForCustomer
    end
  end
end

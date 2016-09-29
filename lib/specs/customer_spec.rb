require File.dirname(__FILE__) + '/../specs/spec_helper'

describe Customer do
  let(:attributes1) { { lname: 'Eeeeia', fname: 'Sandi', gender: 'Female', favorite_color: 'blue', date_of_birth: Date.today - 25.years } }
  let(:attributes2) { { lname: 'Ddddra', fname: 'Kathy', gender: 'Female', favorite_color: 'Grey', date_of_birth: Date.today - 30.years, nonsense: 4 } }
  let(:attributes3) { { lname: 'Ccccuy', fname: 'Some', gender: 'Male', favorite_color: 'gray', date_of_birth: Date.today - 5.years }}
  let(:attributes4) { { lname: 'Bbbbia', fname: 'DestroyerOfWorlds', gender: 'Female', favorite_color: 'Marigold', date_of_birth: Date.today - 15.years }}
  let(:attributes5) { { lname: 'Aaaava', fname: 'FlowerEater', gender: 'Female', favorite_color: 'TICKLE ME PINK', date_of_birth: Date.today }}

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

    # it 'does not have any required fields' do... # needed?
  end

  describe 'Sorting Behavior' do
    let(:customers) { [customer5, customer4, customer3, customer2, customer1] }

    it 'can be sorted by gender, female first, then last name asc' do
      sorting_method = Customer.gender_sort_method
      expect(customers.sort &(sorting_method)).to eq [customer5, customer4, customer2, customer1, customer3]
    end

    it 'can be sorted by date of birth, ascending' do
      sorting_method = Customer.dob_sort_method
      expect(customers.sort &(sorting_method)).to eq [customer2, customer1, customer4, customer3, customer5]
    end

    it 'can be sorted by last name, descending' do
      sorting_method = Customer.lname_sort_method
      expect(customers.sort &(sorting_method)).to eq [customer1, customer2, customer3, customer4, customer5]
    end
  end
end
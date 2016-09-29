require File.dirname(__FILE__) + '/spec_helper'

describe CustomerParser do
  let(:row1){ { lname: 'Eeeeia',  fname: 'Sandi',  gender: 'Female',  favorite_color: 'Blue',  date_of_birth: Date.today - 25.years } }
  let(:row2){ { lname: 'Alie', fname: 'Cokeman', gender: 'female', favorite_color: 'green', date_of_birth: Date.today - 27.years } }
  let(:data){ [row1, row2] }

  describe '#parse' do
    it 'parses pipe-deliminated files' do
      path = 'specs/fixtures/pipe_data.csv'
      expect(CustomerParser.new(path, '|').data == data).to be true
    end

    it 'parses comma-deliminated files' do
      path = 'specs/fixtures/comma_data.csv'
      expect(CustomerParser.new(path, ',').data == data).to be true
    end
  end
end

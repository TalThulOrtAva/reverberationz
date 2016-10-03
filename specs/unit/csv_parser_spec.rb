require File.dirname(__FILE__) + '/spec_helper'

describe CSVParser do
  let(:row1){ { email: 'a@a.com', lname: 'Eeeeia',  fname: 'Sandi',  gender: 'Female',  favorite_color: 'Blue',  date_of_birth: Date.new(1991,9,29) } }
  let(:row2){ { email: 'b@b.com', lname: 'Alie', fname: 'Cokeman', gender: 'female', favorite_color: 'green', date_of_birth: Date.new(1989,9,28) } }
  let(:data){ [row1, row2] }
  let(:csv_string){"email,lname,fname,gender,favorite_color,date_of_birth\na@a.com,Eeeeia,Sandi,Female,Blue,1991-09-29"}

  describe '#parse' do
    it 'parses pipe-deliminated files' do
      path = 'specs/fixtures/pipe_data.csv'
      expect(CSVParser.new(path, '|').raw_data).to eq(data)
    end

    it 'parses comma-deliminated files' do
      path = 'specs/fixtures/comma_data.csv'
      expect(CSVParser.new(path, ',').raw_data).to eq(data)
    end
  end
end

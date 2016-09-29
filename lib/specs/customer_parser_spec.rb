require File.dirname(__FILE__) + '/../specs/spec_helper'

describe CustomerParser do
  let(:headers){ { lname: 'lname', fname: 'fname', gender: 'gender', favorite_color: 'favorite_color', date_of_birth: 'date_of_birth' } }
  let(:row1){ { lname: 'Eeeeia',  fname: 'Sandi',  gender: 'Female',  favorite_color: 'Blue',  date_of_birth: Date.today - 25.years } }
  let(:row2){ { lname: 'Ava', fname: 'Ciccarelli', gender: 'female', favorite_color: 'green', date_of_birth: Date.today - 27.years } }
  let(:data){ [row1, row2] }

  describe '#parse' do
    it 'parses pipe-deliminated files' do
      path = 'specs/spec_data/pipe_data.csv'
      generate_csv_file(path, '|')
      expect(CustomerParser.new(path, '|').data == data).to be true
    end

    it 'parses comma-deliminated files' do
      path = 'specs/spec_data/comma_data.csv'
      generate_csv_file(path,',')
      expect(CustomerParser.new(path, ',').data == data).to be true
    end

    private

    # ...I can't decide if it's weird or not that there's a private spec method, but w/e
    def generate_csv_file(path, delimiter)
      CSV.open(path, 'wb', {col_sep: delimiter }) do |csv|
        csv << headers.values
        csv << row1.values
        csv << row2.values
      end
    end
  end
end

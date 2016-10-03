require_relative 'customer'
require 'csv'

# sometimes I feel like the CSV lib is intentionally clunky explicitly for code challenges
class CustomerFileParser
  attr_reader :raw_data, :customers

  def initialize(path, delimiter)
    @path = path
    @delimiter = delimiter
    import!
  end

  private

  def import!
    read_file!
    convert!
  end

  def convert!
    convert_csv_to_hash!
    convert_dates!
    fix_case!
    create_customers!
  end

  def create_customers!
    @customers = @raw_data.map{ |cust_data| Customer.new(cust_data)}
  end

  def read_file!
    @raw_data = CSV::parse(File.open(@path).read, headers: true, col_sep: @delimiter)
  end

  # TODO probably would make more sense that the customer object would do date conversion/string downcasing
  def fix_case!
    @raw_data = raw_data.each do |customer|
      customer.each { |value| value.downcase! if value.class == String }
    end
  end

  def convert_dates!
    @raw_data = raw_data.each {|customer| customer[:date_of_birth] = customer[:date_of_birth].to_date }
  end

  def convert_csv_to_hash!
    @raw_data = raw_data.map {|row| row.to_h.symbolize_keys! }
  end
end

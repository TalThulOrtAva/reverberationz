require_relative 'customer'
require 'CSV'

class CustDataParser
  attr_reader :data

  def initialize(path, delimiter)
    @path = path
    @delimiter = delimiter
    @data = read_file
    convert_csv_to_hash!
    convert_dates!
  end

  private

  def read_file
    CSV::parse(File.open(@path).read, headers: true, col_sep: @delimiter)
  end

  def convert_dates!
    @data = data.each {|customer| customer[:date_of_birth] = customer[:date_of_birth].to_date }
  end

  def convert_csv_to_hash!
    @data = data.map {|row| row.to_h.symbolize_keys! }
  end
end

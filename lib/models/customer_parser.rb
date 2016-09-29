class CustomerParser
  require_relative 'customer'
  require 'CSV'

  attr_reader :data

  def initialize(path, delimiter)
    csv_table = CSV::parse(File.open(path).read, headers: true, col_sep: delimiter)
    raw = csv_table.map {|row| row.to_h.symbolize_keys! }
    @data = raw.each {|customer| customer[:date_of_birth] = customer[:date_of_birth].to_date }
  end
end

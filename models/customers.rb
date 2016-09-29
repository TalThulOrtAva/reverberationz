require 'customer'
require 'JSON'

class Customers < []
  attr_reader :all

  def initialize(customers)
    @all = customers
  end

  def sort(criteria)

    @all.sort_by { |name, age| [age, name] }

    lambda { |a,b| [a.gender.downcase, a.lname.downcase] <=> [b.gender.downcase, a.lname.downcase] }
    lambda { |a,b| [a.gender.downcase, a.lname.downcase] <=> [b.gender.downcase, a.lname.downcase] }
  end
end

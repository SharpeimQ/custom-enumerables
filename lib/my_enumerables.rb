module Enumerable
  # Your code goes here
  def my_all?
    each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    each do |element|
      return true if yield(element)
    end
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  # Define my_each here
end

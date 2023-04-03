module Enumerable
  # Your code goes here
  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_count
    if block_given?
      reduce(0) { |acc, element| yield(element) ? acc + 1 : acc }
    else
      length
    end
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  # Define my_each here
  def my_each
    if block_given?
      for element in self
        yield(element)
      end
    else
      self
    end
  end

  def my_each_with_index
    if block_given?
      index = 0
      for element in self
        yield(element, index)
        index += 1
      end
    else
      self
    end
  end
end

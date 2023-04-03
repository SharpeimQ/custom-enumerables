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

  def my_inject(default = nil)
    default.nil? ? accumulator = self[0] : accumulator = default
    my_each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end

  def my_map
    mapped = []
    my_each do |element|
      mapped << yield(element)
    end
    mapped
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_select
    selected = []
    my_each do |element|
      yield(element) ? selected << element : selected
    end
    selected
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

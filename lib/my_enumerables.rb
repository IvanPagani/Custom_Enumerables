module Enumerable
  def my_each_with_index
    puts "No block given." unless block_given?
    
    for i in 0...self.length
      yield(self[i], i)
    end

    return self
  end

  def my_select
    puts "No block given." unless block_given?

    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end

    return result
  end

  def my_all?
    puts "No block given." unless block_given?
    
    self.my_each do |elem|
      return false unless yield(elem)
    end

    return true
  end

  def my_any?
    puts "No block given." unless block_given?
    
    self.my_each do |elem|
      return true if yield(elem)
    end

    return false
  end

  def my_none?
    puts "No block given." unless block_given?

    self.my_each do |elem|
      return false if yield(elem)
    end

    return true
  end

  def my_count
    return self.length unless block_given?

    result = 0
    self.my_each do |elem|
      result += 1 if yield(elem)
    end

    result
  end

  def my_map
    puts "No block given." unless block_given?

    result = []
    self.my_each do |elem|
      result << yield(elem)
    end

    result
  end

  def my_inject(default)
    puts "No block given." unless block_given?
    
    result = default

    self.my_each do |elem|
      result = yield(result, elem)
    end

    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

class Array
  def my_each
    puts "No block given." unless block_given?
    # return enum_for(:my_each) unless block_given?
    
    for i in 0...self.length
      yield(self[i])
    end

    return self
  end
end

require 'pry' 

class Triangle
  attr_accessor :a, :b, :c 
  attr_reader :sides  
  
  def initialize(a, b, c) 
    @a = a 
    @b = b 
    @c = c 
    @sides = [a, b, c]
  end 
  
  def valid? 
    self.sides.all?{|side| side > 0} && triangle_inequality? 
  end 
  
  def triangle_inequality?
    check_1 = @a + @b > @c
    check_2 = @a + @c > @b 
    check_3 = @b + @c > @a 
    check_1 && check_2 && check_3 
  end 

  
  def equilateral?
    @a == @b && @b == @c
  end 
    
  def isosceles? 
    @a == @b || @a == @c || @b == @c 
  end 

  def scalene?
    @a != @b && @a != @c && @b != @c 
  end 
    
  
  def kind 
    if !(self.valid?) 
      raise TriangleError
    elsif equilateral? 
      :equilateral 
    elsif isosceles? 
      :isosceles 
    else scalene? 
      :scalene 
    end 
  end 

  class TriangleError < StandardError 
    def message 
      "this is not a valid triangle."
    end 
  end 
end

  
triangle_2 = Triangle.new(5,5,5).kind  


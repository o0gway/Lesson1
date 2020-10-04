require_relative 'acсessors'

class Test
  include Accessors

  attr_accessor_with_history :a, :b
  strong_attr_accessor :c, Integer
  strong_attr_accessor :d, String
end

test = Test.new
test.a = 100
test.a = 200
p test.a
p test.a_history

test.c = 4
p test.c
test.d = 5





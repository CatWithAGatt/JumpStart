def not_equals_2 arr
  arr.select { |x| x != 2 }.inject(0) { |sum, num| sum + num }
end

puts not_equals_2([1,2,3,4])

# Write a function that takes in a number and sums all the
# numbers up to that number
def sum_to(number)
  (1..number).to_a.inject(0) { |sum,x| sum + x }
end

# Test - these should all print out true!
puts "\nSum To:\n" + "*" * 15 + "\n"
puts sum_to(5) == 15
puts sum_to(3) == 6
puts sum_to(1) == 1
puts sum_to(0) == 0

# *********************************************

# Write a function that takes in an amount of minutes and returns
# a time string formatted HH:MM
def time_conversion(minutes)
  hours = minutes / 60 < 10 ? "0" + (minutes / 60).to_s : (minutes / 60).to_s
  mins = minutes % 60 < 10 ? "0" + (minutes % 60).to_s : (minutes % 60).to_s
  "#{hours}:#{mins}"
end

# Test - these should all print true!
puts "\nTime Conversion:\n" + "*" * 15 + "\n"
puts time_conversion(30) == "00:30"
puts time_conversion(60) == "01:00"
puts time_conversion(90) == "01:30"
puts time_conversion(120) == "02:00"
puts time_conversion(10) == "00:10"
puts time_conversion(5) == "00:05"
puts time_conversion(0) == "00:00"

# *********************************************
# Write a function that takes an array of pairs and returns the
# pair with the greatest sum
def largest_pair(pairs_array)
  largest = pairs_array[0]
  for i in 1...pairs_array.size
    largest = pairs_array[i] if pairs_array[i][0] + pairs_array[i][1] >
                                largest[0] + largest[1]
  end
  largest
end

#Tests - Get all these to print true
puts "\nLargest Pair:\n" + "*" * 15 + "\n"
puts largest_pair([[1,0]]) == [1,0]
puts largest_pair([[1,0],[1,1],[1,2]]) == [1,2]
puts largest_pair([[-4,0],[-2,-1],[-3,2]]) == [-3,2]


# *********************************************

# Write a function that returns a phrase with each
# word (separated by spaces) capitalized.
def capitalize_each_word(phrase)
  phrase.split.each { |x| x[0] = x[0].upcase }.join(' ')
end

#Get these to true!!
puts "\nCapitalize:\n" + "*" * 15 + "\n"
puts capitalize_each_word("abc") == "Abc"
puts capitalize_each_word("lets go dubs") == "Lets Go Dubs"
puts capitalize_each_word("CODE IS LIFE") == "CODE IS LIFE"
dont_change_this = "do not mutate me"
capitalize_each_word(dont_change_this)
puts dont_change_this == "do not mutate me"

# *********************************************

# Write a boolean function that returns true if an array of numbers
# has any multiples of 3.
def has_multiple_of_three?(numbers)
  numbers.any? {|x| x % 3 == 0}
end

#Tests - More trues
puts "\nHas multiples of three:\n" + "*" * 15 + "\n"
puts has_multiple_of_three?([1]) == false
puts has_multiple_of_three?([3]) == true
puts has_multiple_of_three?([1,2,4,5,7,8]) == false
puts has_multiple_of_three?([1,2,4,5,6,7,12]) == true

# *********************************************

# If you didn't use enumerable any? in has_multiple_of_three?
# write it again using any?

# *********************************************

# Write a function that take an array of numbers and returns a
# hash of the number of even numbers and of odd numbers.

def evens_and_odds(numbers)
  h = {'even' => 0, 'odd' => 0}
  numbers.each do |x|
    if x % 2 == 0
      h['even'] += 1
    else
      h['odd'] += 1
    end
  end
  h
end

#Test - Get these all true, look at the format of the return value
puts "\nEvens and odds:\n" + "*" * 15 + "\n"
puts evens_and_odds([1,3])['even'] ==  0
puts evens_and_odds([1,3])['odd'] ==  2

puts evens_and_odds([2,4])['even'] == 2
puts evens_and_odds([2,4])['odd'] == 0

puts evens_and_odds([]) == {'even' => 0, 'odd' => 0}
puts evens_and_odds([1,2,3]) == {'even' => 1, 'odd' => 2}

# *********************************************

# Write a function that takes in a word and returns the counts of each
# letter in that word.

def letter_counts(word)
  hash = Hash.new(0)
  word.split('').each { |x| hash[x] += 1 }
  hash
end

# Tests must all print true
puts "\nLetter Counts:\n" + "*" * 15 + "\n"
puts letter_counts("hi") == { 'h' => 1, 'i' => 1 }
puts letter_counts("hello") == { 'h' => 1, 'e' => 1 , 'l' => 2, 'o' => 1}

# *********************************************

# Take a moment and refactor your previous code to make it look sexy and
# use good coding style!

# *********************************************

# Write a boolean function palindrome? which takes in a word and returns
# true if it is palindrome.

def palindrome?(string)
  string == string.reverse
end

#Tests
puts "\nPalindrome:\n" + "*" * 15 + "\n"
puts palindrome?("a") == true
puts palindrome?("aa") == true
puts palindrome?("ab") == false
puts palindrome?("racecar") == true
puts palindrome?("coder") == false

# *********************************************

# Write a function that will reverse the digits of a number.
def reverse_digits(number)
  number.to_s.reverse.to_i
end

#Tests
puts "\nReverse Digits:\n" + "*" * 15 + "\n"
puts reverse_digits(1) == 1
puts reverse_digits(12) == 21
puts reverse_digits(1738) == 8371

# *********************************************

# Write a function that returns the longest word in a sentence
def longest_word(phrase)
  arr = phrase.split
  biggest = arr.first
  for i in 1...arr.size
    biggest = arr[i] if arr[i].length > biggest.length
  end
  biggest
end

# Tests - these should all print out true!
puts "\nLongest word:\n" + "*" * 15 + "\n"
puts longest_word("lets go warriors") == ("warriors")
puts longest_word("warriors are the best") == ("warriors")
phrase = "go steph go"
longest_word(phrase)
puts phrase == "go steph go"

# *********************************************

# Write a method that will take a list of names and return a hash of
# first initials and the number of times they appear.
def count_initials(names)
  hash = Hash.new(0)
  names.each { |x| hash[x[0]] += 1 }
  hash
end

#Tests
puts "\nCount Initials:\n" + "*" * 15 + "\n"
dubs = ["Steph", "Harrison", "Klay", "Andrew", "Andre", "Draymond", "Shaun"]
puts count_initials(dubs) == { "S" => 2, "H" => 1, "K" => 1, "D" => 1, "A" => 2 }

# *********************************************

# Write a function that takes an array of integers and uses each to
# calcuate their squares, returning them as an array.

# *********************************************

def compute_squares(array)
  array.map { |x| x ** 2 }
end

#Tests
puts "\ncompute squares\n" + "*" * 15 + "\n"
puts compute_squares([]) == []
puts compute_squares([9]) == [81]
puts compute_squares([1, 2, 3, 4]) == [1, 4, 9, 16]
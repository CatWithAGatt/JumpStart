# Write a method that takes an array of words and returns only the words that are
# anagrams of a given string.

def anagrams(string, array)
  #check each permutation of string to see if array includes it
  # if so, add to a return array
  # permute method 'combos' found at:
  # https://stackoverflow.com/questions/5773961/all-possible-permutations-of-a-given-string
  ret = []

  combos = string.chars.to_a.permutation.map &:join

  array.each { |word| ret << word if combos.include?word }

  ret
end

#Tests
puts "\nAnagrams:\n" + "*" * 15 + "\n"
puts anagrams("cat", ["cat"]) == ["cat"]
words = ["cat", "act", "bat", "tac"]
puts anagrams("tca", words) == ["cat", "act", "tac"]
words = ["aaa", "aa", "a"]
puts anagrams("aa", words) == ["aa"]

# ************************************
# Write a boolean function that returns true if the vowels
# in a given word appear in order

def ordered_vowel_word?(word)
  # extract all vowels
  # check order
  vowels = ['a','e','i','o','u']
  found = []
  word.split('').each { |letter| found << letter if vowels.include?(letter)}
  return true if found.length <= 1
  for i in 0...found.size - 1
    for k in i+1...found.size
      return false if found[i] > found[k]
    end
  end
  true
end

#Tests
puts "\nOrdered Vowel Word:\n" + "*" * 15 + "\n"
puts ordered_vowel_word?("car") == true
puts ordered_vowel_word?("academy") == true
puts ordered_vowel_word?("programmer") == false
puts ordered_vowel_word?("grapefruit") == false

# ************************************
# Write a function that takes an array of words and returns
# the words whose vowels appear in order

def ordered_vowels(words)
  ret = []
  words.each { |word| ret << word if ordered_vowel_word?(word) }
  ret
end

puts "\nOrdered Vowels:\n" + "*" * 15 + "\n"
puts ordered_vowels(["are"]) == ["are"]
puts ordered_vowels(["era", "are", "ear"]) == ["are"]
puts ordered_vowels(["hey", "wassup", "hello"]) == ["hey", "wassup", "hello"]
puts ordered_vowels(["firefox", "chrome", "safari", "netscape", "aeiou"]) == ["safari", "aeiou"]

# ************************************
# Write a function that takes two years and returns all the years
# within that range with no repeated digits.
# Hint: helper method?
# no_repeat_years(2010,2015) -> [2013,2014,2015]

def no_repeat_years(first_year, last_year)
  ret = []
  for x in first_year..last_year
    repeats = false

    year = x.to_s.split('')
    year_tester = []
    year.each do |num|
      if !(year_tester.include?num)
        year_tester << num
      else
        repeats = true
      end
    end

    ret << x if !repeats
  end
  ret
end

puts "\nNo Repeat Years:\n" + "*" * 15 + "\n"
puts no_repeat_years(1990, 2000) == []
puts no_repeat_years(1900,1902) == [1902]
puts no_repeat_years(2016, 2020) == [2016, 2017, 2018, 2019]


# ************************************
# Write a method that takes a string of lower case words (no punctuation)
# and returns the letter that occurs most frequently.
# Use a hash within your method to keep track of the letter counts.
# You will need to account for spaces.  There are a few ways you can do this.

def most_frequent_letter(string)
  hash = Hash.new(0)
  string.split('').each do |char|
    hash[char] += 1 if char.between?('a','z')
  end
  ret = ''
  biggest = 0
  hash.each do |k,v|
    if v > biggest
      biggest = v
      ret = k
    end
  end
  ret
end

puts "\nMost Frequent Letter\n" + "*" * 15 + "\n"
puts most_frequent_letter("aaaaa") == "a"
puts most_frequent_letter("aaaaabbbbbb") == "b"
puts most_frequent_letter("we the people in order to form a more perfect union") == "e"


# ************************************
# Write a method that takes a string of lower case words (no punctuation)
# and returns an array of letters that occur more
# than once.  We'll need to account for spaces, too.  Again, there are
# a few ways you can do this.

def non_unique_letters(string)
  hash = Hash.new(0)
  string.split('').each do |char|
    hash[char] += 1 if char.between?('a','z')
  end
  ret =[]
  hash.each { |k,v| ret << k if v > 1 }
  ret
end

puts "\nNon-Unique Letters\n" + "*" * 15 + "\n"
puts non_unique_letters("abbbcdddde") == ["b", "d"]
puts non_unique_letters("abcde") == []
puts non_unique_letters("aabbccddee") == ["a", "b", "c", "d", "e"]
puts non_unique_letters("aaa bbb c d eee") == ["a", "b", "e"]

# ************************************
# Write a method that takes a string of lower case words and returns
# an array of letters that do not occur in the string.
# This problem requires a different approach from the one we used
# in most_frequent_letter and we will need to show some care
# in how we set up the hash or process it to get the result.  Do you see why?
# We'll need to account for spaces, too.  Again, there are a few ways you can do this.

def missing_letters(string)
  alphabet = "abcdefghijklmnopqrstuvwxyz".split('')
  str = string.split('')
  ret = []
  alphabet.each { |char| ret << char if !(str.include?char) }
  ret
end

puts "\nMissing Letters\n" + "*" * 15 + "\n"
puts missing_letters("abcdefghijklmnopqrstuvwxyz") == []
puts missing_letters("abcdefghiklmnopqrstuvwxyz") == ["j"]
puts missing_letters("abcdefghiklmnopstuvwxyz") == ["j", "q", "r"]

#write a function primes that an arguement n and returns the first n primes

def primes(n)
  counter = 0
  i = 2
  prime = []
  while true
    break if counter == n
    if is_prime?(i)
      counter += 1
      prime << i
    end
    i += 1
  end
  prime
end

def is_prime?(number)
  for x in 2..number/2
    return false if number % x == 0
  end
  true
end

puts "\nPrimes:\n" + "*" * 15 + "\n"
puts primes(0) == []
puts primes(1) == [2]
puts primes(2) == [2,3]
puts primes(6) == [2,3,5,7,11,13]

#write a boolean function zero_sum? that takes an array of intergers and returns
#true if 2 elements in the array sum to zero.

# NOTE: For this question, do the "write out the variables" exercise from part 4 after
# you've written a first draft.

def zero_sum?(array)
  for i in 0...array.size-1
    for k in i+1...array.size
      return true if array[i] + array[k] == 0
    end
  end
  false
end

puts "\nZero Sum:\n" + "*" * 15 + "\n"
puts zero_sum?([1, -1]) == true
puts zero_sum?([1,1,0,2,1]) == false
puts zero_sum?([1,1,0,2,1,0]) == true
puts zero_sum?([2,3,4,-3,1]) == true

# write a function largest_sum_pair that takes an array of intergers and returns the
# 2 unique indices whose elements sum to the largest number.
# Formatted [earlier_index, later_index]

# NOTE: For this question, do the "write out the variables" exercise from part 4 after
# you've written a first draft.

def largest_sum_pair(array)
  biggest = array.min * 2 + 1
  indexes = []
  for i in 0...array.size-1
    for k in i+1...array.size
      if array[i] + array[k] > biggest
        biggest = array[i] + array[k]
        indexes = [i,k]
      end
    end
  end
  indexes
end

puts "\nLargest Sum Pair:\n" + "*" * 15 + "\n"
puts largest_sum_pair([1,2,3,4,5]) == [3,4]
puts largest_sum_pair([3,2,1,0,1,2,3]) == [0,6]
puts largest_sum_pair([-2,-1,-1,-2,-3]) == [1,2]

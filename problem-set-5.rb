# chunk an array into nested arrays of length n
def chunk(array, n)
  arr = []
  while array.size > n
    temp = []
    n.times do
      temp << array.shift
    end
    arr << temp
  end
  arr << array
end

puts "---------chunk-------"
puts chunk([1, 8, 9, 4, "hey", "there"], 2) == [[1, 8], [9, 4], ["hey", "there"]]
puts chunk([10, 9, 8, 7, 6, 5, 4], 3) == [[10, 9, 8], [7, 6, 5], [4]]

# Translate into pig-latin! First consonants go to the end of a word. End with "ay"
def pig_latin(words)
	vowels = ['a', 'e', 'i', 'o', 'u']
	words = words.split(" ")

	words.each do |x|
		if vowels.include? x[0]
			x << 'ay'
    else
      if vowels.include? x[1]
        letter = (x[0] == 'q') ? x.slice!(0, 2) : x.slice!(0)
      elsif vowels.include? x[2]
        letter = (x[1] == 'q') ? x.slice!(0, 3) : x.slice!(0, 2)
      else
        letter = x.slice! 0, 3
      end
      x << letter + 'ay'
		end
	end

	words.join(" ")
end

puts "---------pig latin-------"
puts pig_latin("i speak pig latin") == "iay eakspay igpay atinlay"
puts pig_latin("throw me an aardvark") == "owthray emay anay aardvarkay"

# Remove the nth letter of the string
def remove_nth_letter(string, n)
  str = string.split('')
  temp = ""
  remove = n > 0 ? n : string.length - n.abs
  for i in 0...string.length
    temp += str[i] unless i == remove
  end
  temp
end

puts "---------remove nth letter-------"
puts remove_nth_letter("helloworld", 5) == "helloorld"
puts remove_nth_letter("helloworld", -3) == "hellowold"

# Boolean function: check if short_string is a substring of long_string
def substring?(long_string, short_string)
  long_string.include?short_string
end

puts "---------substring-------"
puts substring?("thisisaverylongstring", "sisa") == true
puts substring?("thisisaverylongstring", "ting") == false
puts substring?("whatifikeptontypingforever", "ik") == true

# count the number of times that two adjacent numbers in an array add up to n.
# You cannot reuse a number. So count_adjacent_sums([1, 5, 1], 6) => 1

def count_adjacent_sums(array, n)
  counter = 0
  rounds = 0
  while rounds < array.size - 1
    if array[rounds] + array[rounds + 1] == n
      counter += 1
      rounds += 1
    end
    rounds += 1
  end
  counter
end

puts "---------count adjacent sums-------"
puts count_adjacent_sums([7, 2, 4, 6, 8, 10], 7) == 0
puts count_adjacent_sums([6, 7, 11, 2, 5, 10, 3], 13) == 3
puts count_adjacent_sums([1, 9, 1, 8, 2, 10], 10) == 2

# update the older inventory with the newer inventory. Add any new items to the
# hash and replace the values for items that already exist.

def inventory_hash(older, newer)
  newer.each do |k,v|
      older[k] = v
  end
  older
end

puts "---------inventory hash-------"
march = {rubies: 10, emeralds: 14, diamonds: 2}
april = {emeralds: 27, moonstones: 5}
puts inventory_hash(march, april) == {rubies: 10, emeralds: 27, diamonds: 2, moonstones: 5}

# Now, alphabetical order matters in your inventory. Insert new inventory items into
# your array in the appropriate place
def inventory_array(older, newer)
    newer.each_with_index do |new_arr, new_ind|
      inserted = false
      older.each_with_index do |old_arr, old_ind|
        if older[old_ind][0] == newer[new_ind][0]
          older[old_ind][1] = newer[new_ind][1]
          inserted = true
        end
      end
      older << newer[new_ind] if !inserted
    end

    older.sort
end

puts "---------inventory array-------"
march_array = [['diamonds', 2], ['emeralds', 14], ['rubies', 10]]
april_array = [['emeralds', 27], ['moonstones', 5]]
puts inventory_array(march_array, april_array) == [['diamonds', 2], ['emeralds', 27], ['moonstones', 5], ['rubies', 10]]

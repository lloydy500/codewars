
# Given two arrays a and b write a function comp(a, b) (compSame(a, b) in Clojure) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

# Examples
# Valid arrays
# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

# a = [121, 144, 19, 161, 19, 144, 19, 11] 
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
# iterate through and map a squared array to new array a_sqrd
# compare new array and return any matched items in b array with '&' operator
# return true if new array sqrd values equal matched array (intersection)

# def comp(array1, array2)
#   return false if array1.empty? || array2.empty?
#   return false if array1.nil? || array2.nil?
#   array_1_sqrd = array1.map { |item| item**2 }
#   matches_array = array_1_sqrd & array2
#   matches_array == array_1_sqrd.uniq
# end

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  a_sq = array1.map { |num| num**2 }
  matches = a_sq.select { |num| array2.include?(num) }
  matches.sort == array2.sort
end

# def comp(array1, array2)
#   array1.nil? || array2.nil? ? false : array1.sort.map {|v| v ** 2} == array2.sort
# end

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]

p comp(a,b)
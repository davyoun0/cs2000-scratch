use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun list-of-squares(numbers :: List<Number>) -> List<Number> block:
  doc: "produce the squares of the numbers in the input"

  var result = [list: ]
  
  for each(n from numbers):
    result := result + [list: n * n]
  end
  
  result
where:
  list-of-squares([list: ]) is [list: ]
  list-of-squares([list: 5, 6]) is [list: 25, 36]
  list-of-squares([list: -1, 0, 1]) is [list: 1, 0, 1]
end

# Practice Problem 3

# Design a function sum-of-evens that takes a list of numbers, and returns the sum of just the even numbers in the list. You must use for each, rather than a built-in list function or recursion.

fun sum-of-evens(numbers :: List<Number>) -> Number block:
  doc: "returns sum of just the even numbers"
  
  var result1 = 0
  
  for each(n from numbers):
    if num-modulo(n, 2) == 0:
      result1 := result1 + n
    else:
      result1
    end
  end
  
  result1
  
where:
  sum-of-evens([list: ]) is 0
  sum-of-evens([list: 3, 4, 5, 6]) is 10
  sum-of-evens([list: 2, 7, 8, 6]) is 16
end

# Practice Problem 4

# Design a function count-longer-than that takes a list of strings and a number n, and returns how many strings in the list have length greater than n. You must use for each, rather than a built-in list function or recursion.

fun count-longer-than(string :: List<String>, numbers2 :: Number) -> Number block:
  doc: "returns how many strings in the list have length greater than n"
  
  var result2 = 0
  
  for each(s from string):
    if string-length(s) > n:
      result2 := result2 + 1
    else:
      result2
    end
  end
  
  result2
end

# Practice Problem 5

# Design a function running-max that takes a list of numbers, and returns the largest number seen so far, not the max of the whole list — i.e., it returns a list of the same length, where each element is the maximum of all elements up to and including that position. For example, given [list: 3, 1, 4, 1, 5], it should return [list: 3, 3, 4, 4, 5]. You must use for each, rather than a built-in list function or recursion.
  

fun running-max(number :: List<Number>) -> List<Number> block:
  
  var result4 = [list: ]
  var current-max = 0
  
  for each(n from number):
    
  
# Practice Problem 6

# Design a function concat-all that takes a list of strings, and returns a single string formed by concatenating all of them together, in order. You must use for each, rather than a built-in list function or recursion.

# Practice Problem 7 (two accumulators)

# Design a function count-and-sum that takes a list of numbers, and returns a pair (use a 2-element list, e.g. [list: count, total]) where the first element is how many numbers are in the list, and the second is their sum. You must use for each, and you'll need to mutate two separate vars inside the same loop.

# A few things to watch for as you work through these, based on where the rubric usually bites:

  #Design a function has-positive that takes a list of numbers, and returns true if at least one number in the list is positive, false if none are. You must use for each, rather than a built in list function or recursion.
  
fun has-positive(numbers :: Number) -> Boolean block:
  
  var result3 = false
  
  for each(n from numbers):
    when n>0: 
      result3 := true
    end
  end
  
  result3
  
where:
end

  #Design a function all-increasing that takes a list of numbers, and returns true if each number is greater than the preceding number, false otherwise. It should return true for the empty list. You must use for each, rather than a built in list function or recursion.

fun all-increasing(numbers :: Number) -> Boolean:
  
  var 
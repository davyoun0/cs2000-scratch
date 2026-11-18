use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# Sample question: Design a data definition for Beverage that can be either coffee with number of shots of espresso, or tea with name and brew-time in minutes. Then, write a function is-strong that returns true if the beverage is a coffee with more than 2 shots, or a tea brewed for more than 5 minutes.

data Beverage:
  | coffee(shots :: Number)
  | tea(name :: String, brew-time :: Number)
end

fun is-strong(b :: Beverage) -> Boolean:
  doc: "determine if beverage is strong (coffee >2 shots or tea >5 minutes)"
  cases (Beverage) b:
    | coffee(shots) => shots > 2
    | tea(name, brew-time) => brew-time > 5
  end
where:
  regular = coffee(1)
  strong-coffee = coffee(3)
  weak-tea = tea("Green Tea", 3)
  strong-tea = tea("Black Tea", 7)
  
  is-strong(regular) is false
  is-strong(strong-coffee) is true
  is-strong(weak-tea) is false
  is-strong(strong-tea) is true
end

# Design a data definition for Restaurant that can be either yahoo with name and stars, or health-score with name and score. Then, write a function is-reputable that returns true if the resturant is a yahoo with at least 4 stars, or a health-score with score at least 85.

data Restaurant:
  | yahoo(name :: String, stars :: Number)
  | health-score(name :: String, score :: Number)
end

fun is-reputable(r :: Restaurant) -> Boolean:
  doc: "returns if restaurant is a yahoo with at least 4 stars or healthscore with at least 85"
  
  cases(Restaurant) r:
    | yahoo(name, stars) => stars > 4
    | health-score(name, score) => score > 85
  end
  
where:
  burri



# data Restaurant:
#   | yahoo(name :: String, stars :: Number)
#   | health-score(name :: String, score :: Number) 
# end

# fun is-reputable(r :: Restaurant) -> Boolean:
#   doc: "Returns true if the restaurant is a yahoo with at least 4 stars or a health score with score at least 85"
  
#   cases (Restaurant) r:
#     | yahoo(name, stars) => stars >= 4
#     | health-score(name, score) => score >= 85
#   end
# where:
#   burrito = yahoo("Saxbys", 4.2)
#   Pizza = health-score("Marcelos", 80)
#   Burger= yahoo("Mcdonalds", 4)
#   Pasta = health-score("Olio", 85)
#   Rice = health-score("Chinese", 90)
  
#   is-reputable(burrito) is true
#   is-reputable(Pizza) is false
#   is-reputable(Burger) is true
#   is-reputable(Pasta) is true
#   is-reputable(Rice) is true
# end   

# Design a data definition for Book that can be either rating with title, stars, and num-reviews, or sales-ranking with title and position. Then, write a function is-popular that returns true if the book is a rating with num-reviews of at least 500, or a sales-ranking with position less than 500.

data Book:
  | rating(title :: String, stars :: Number, num-reviews :: Number)
  | sales-ranking(title :: String, position :: Number) 
end

fun is-popular(b :: Book) -> Boolean:
  doc: "true if book is rating with num-reviews of at least 500, or sales-ranking with position less than 500" 
  
  cases (Book) b:
    | rating(title, stars, num-reviews) => num-reviews >= 500
    | sales-ranking(title, position) => position < 500
  end
  
where: 
  Novel = rating("david", 5, 600)
  Fantasy = rating("Northeastern", 7, 500) 
  Stem = sales-ranking("Bigbang", 200) 
  Hum = sales-ranking("Gun", 500)
  
  is-popular(Novel) is true
  is-popular(Fantasy) is true
  is-popular(Stem) is true
  is-popular(Hum) is false
end

# Skill 5

fun make-positive(lon :: List<Number>) -> List<Number>:
  doc: "take the absolute value of each number in the list"
  
  cases (List) lon:
    | empty => empty
    | link(first, rest) =>
      if first > 0:
        link(first, make-positive(rest))
      else:
        link(0 - first, make-positive(rest))
      end        
  end
where:
  make-positive([list: ]) is [list: ]
  make-positive([list: -1, 0, 2]) is [list: 1, 0, 2]
end
      
# Using recursion, design a function count-warm that takes a list of numbers and returns a count of numbers greater than 70.

fun count-warm(lon :: List<Number>) -> Number: 
  doc: "returns count of numbers greater than 70"
  
  cases(List) lon:
    | empty => 0
    | link(first, rest) => 
      if first > 70:
        1 + count-warm(rest)
      else:
        count-warm(rest)
      end
      
  end
where:
  count-warm([list: 71, 69, 72]) is 2
  count-warm([list: 70, 80, 20]) is 1
end
        

# Using recursion, design a function build-string that takes a list of strings and returns a single large string containing the original strings concatenated together in order.

fun build-string(str :: List<String>) -> String:
  doc: "returns string"
  
  cases(List) str:
    | empty => ""
    | link(first, rest) => 
      first + build-string(rest)
  end
  
where:
  build-string([list: "Hello"]) is "Hello"
  build-string([list: "Water and bottle"]) is "Water and bottle"
  build-string([list: ]) is "" 
end

#|
   problem 1:
   Using recursion, design a function cap-scores that
   takes a list of test scores and returns a new list
   where any score above 100 is replaced with 100. All
   other scores stay the same
|#

fun cap-scores(scores :: List<Number>) -> List<Number>:
  doc: "replaces score above 100 with 100"
  
  cases(List) scores:
    | empty => empty
    | link(first, rest) =>
      if first > 100:
        link(100, cap-scores(rest))
      else:
        link(first, cap-scores(rest))
      end
  end
  
where:
  cap-scores([list: 102, 80, 70, 105]) is [list: 100, 80, 70, 100]
end


#|
   problem 2:
   Using recursion, design a function over-time that takes
   a list of durations (in seconds) and a time limit (in
   seconds), and returns the sum of all durations that are
   longer than the time limit.
|#

fun over-time(durations :: List<Number>, limit :: Number) -> Number:
  doc: "returns the sum of all durations that are longer than the time limit"
  
  cases(List) durations:
    | empty => 0
    | link(first, rest) =>
      if first > limit:
        first + over-time(rest, limit)
      else:
        over-time(rest, limit)
      end
  end
  

# fun over-time(durations :: List<Number>, limit :: Number) -> Number:

# doc: "returns sum of all durations that are longer than the time limit"

#   cases(List) durations:
#     | empty => 0 
#     | link(first, rest) => 
#       if first > limit:
#         first + over-time(rest, limit)
#       else:
#         over-time(rest, limit)
#       end
#   end
  
# where:
#   over-time([list: ], 60) is 0
#   over-time([list: 30, 45], 60) is 0
#   over-time([list: 90, 30, 120], 60) is 210
#   over-time([list: 60, 61], 60) is 61
# end


#|
   problem 3:
   Using recursion, design a function count-in-zone that
   takes a list of heart rates, a low limit, and a high
   limit, and returns how many heart rates fall within the
   zone (greater than the low and less than the high)
|#
   

fun count-in-zone(rate :: List<Number>, ll :: Number, hl :: Number) -> Number: 
  
  doc: "returns how many heart rates fall within the zone"
  
  cases(List) rate:
    | empty => 0
    | link(first, rest) => 
      if first > ll:
        if first < hl:
          1 + count-in-zone(rest, ll, hl)
        else:
          count-in-zone(rest, ll, hl)
        end
      else:
        count-in-zone(rest, ll, hl)
      end
  end
  
where:
  count-in-zone([list: 100, 20, 70, 60, 80, 95], 65, 94) is 2
end

    #Design a function count-internal-nodes that, given the BinTree data definition below, takes a BinTree and returns the total number of internal nodes (non-leaf nodes) in the tree

data BinTree<a>:
  | leaf(val :: a)
  | node(left :: BinTree<a>, right :: BinTree<a>)
end

    # Answer meeting expectations:

fun count-internal-nodes(tree :: BinTree) -> Number:
  doc: "counts the number of nodes that are not leafs"
  cases (BinTree) tree:
    | leaf(val) => 0
    | node(left, right) => 1 + count-internal-nodes(left) + count-internal-nodes(right)
  end
where:
  tree = node(node(leaf(0), leaf(0)), node(node(leaf(0), leaf(0)), leaf(0)))
  count-internal-nodes(tree) is 4
  count-internal-nodes(leaf(1)) is 0
end
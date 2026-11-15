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
  doc: "Returns true if the restaurant is a yahoo with at least 4 stars or a health score with score at least 85"
  
  cases (Restaurant) r:
    | yahoo(name, stars) => stars >= 4
    | health-score(name, score) => score >= 85
  end
where:
  burrito = yahoo("Saxbys", 4.2)
  Pizza = health-score("Marcelos", 80)
  Burger= yahoo("Mcdonalds", 4)
  Pasta = health-score("Olio", 85)
  Rice = health-score("Chinese", 90)
  
  is-reputable(burrito) is true
  is-reputable(Pizza) is false
  is-reputable(Burger) is true
  is-reputable(Pasta) is true
  is-reputable(Rice) is true
end   

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


      
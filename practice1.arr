use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


  
  
fun welcome(name :: String) -> String:
    "Welcome to class," + name
end

fun cake(c1 :: String, c2 :: String, c3 :: String) -> Image:
  cake1 = rectangle(50, 60, "solid", c1)
  cake2 = rectangle(70, 60, "solid", c2)
  cake3 = rectangle(80, 60, "solid", c3)
  above(cake1, above(cake2, cake3))
end

fun t-shirt(phrase :: String, Times :: Number) -> String:
  Times * phrase
end

#cost for 4 t-shirts with "Go Team!"
4 * (5+(0.10*8))

#cost for 7 t-shirts with "Hello World"
7 * (5+(0.10*10))
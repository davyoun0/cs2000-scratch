use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun has-positive(numbers :: List<Number>) -> Boolean block:
  
  var result = false
  
  for each(n from numbers): 
    when n > 0: 
      result := true
    end
  end
  
  result
    
where:
    has-positive([list: ]) is false
    has-positive([list: 2, -1, 2]) is true
  has-positive([list: -1, -4, 0]) is false
    has-positive([list: 1, 2, 3]) is true
end

fun add-bad-year-column(t :: Table) -> Table:
  doc: "adds a new column bad year that contains if the costs exceed revenues for that year"
  fun revenue-track(r :: Row) -> Boolean:
          r["costs"] > r["revenues"]
        end
        
        build-column(t, "bad-year", revenue-track)
        
where: 
original = table: year, costs, revenues
                row: 2022, 500, 300
                row: 2023, 200, 400
                row: 2024, 600, 600
              end
              
  result = table: year, costs, revenues, bad-year
            
            row: 2022, 500, 300, true
            row: 2023, 200, 400, false
            row: 2024, 600, 600, false
          end
          
  add-bad-year-column(original) is result
        end

fun find-drought-risks(t :: Table) -> Table: 
  
  fun is-drought(r :: Row) -> Boolean:
    r["rainfall-2023"] > r["rainfall-2024"]
  end
  
  filter-with(t, is-drought)

where: 
  original = table: region, rainfall-2023, rainfall-2024
    row: "Alaska", 50, 30
    row: "Nebraska", 50, 50
    row: "California", 40, 60
  end
  
  result = table: region, rainfall-2023, rainfall-2024
    row: "Alaska", 50, 30
  end
  
  find-drought-risks(original) is result
end

fun has-positive(
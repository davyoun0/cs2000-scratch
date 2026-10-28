use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


import lists as L

fun is-skipped(n :: Number) -> Boolean:
  doc: "returns true if the app skips and false if not"
  n < 60

where:
  is-skipped(30) is true
  is-skipped(59) is true
  is-skipped(60) is false
  is-skipped(240) is false
end


fun playable(queue :: List<Number>) -> List: 
  L.filter(lam(q): not(is-skipped(q)) end, queue)
    
where: 
  playable([list: 30, 200, 59, 60]) is [list: 200, 60]
  playable([list: 45]) is [list: ]
  playable([list: ]) is [list: ]
  
end

fun tracks-finished(queue :: List<Number>, len :: Number) -> Number block:
  doc: "takes lenth and queue to detrmine how many tracks finished during the commute"
  
  var count1 = 0
  var songs-length = 0 
  
  for each(songs from playable(queue)) block:
    songs-length := songs-length + songs
    if songs-length <= len block:
      count1 := count1 + 1
    else: 
      songs-length := songs-length
    end
  end
  
  count1
  
where:
  tracks-finished([list: ], 600) is 0
  tracks-finished([list: 300, 200], 600) is 2
  tracks-finished([list: 300, 400, 100], 600) is 1
  tracks-finished([list: 30, 300, 45, 300], 600) is 2
  tracks-finished([list: 600], 600) is 1
  
end

monday = table: title :: String, seconds :: Number
  row: "Intro", 15
  row: "Morning Light", 210
  row: "Sponsor Message", 30
  row: "Long Road", 420
  row: "Station Break", 45
  row: "Northbound", 180
  row: "Last Stop", 240
end

fun commute-report(t :: Table, len :: Number) -> String: 
  len := len*60 

  tracks-finished(

    where:
commute-report(monday, 12) is "Finished 2 of 4 playable tracks, skipped 3"


    
    
  
  

  
   
  
  
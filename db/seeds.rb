# Airports
Airport.create(code:"SFO")
Airport.create(code:"ATL")
Airport.create(code:"LAX")
Airport.create(code:"JFK")
Airport.create(code:"LAS")
Airport.create(code:"SEA")
Airport.create(code:"SLC")
Airport.create(code:"PHL")

# Flights
7.times do |i|
	start = Time.now + (i * 86400)
	Flight.create(start: start, end:start + 50000, from_airport: Airport.find(i+1), to_airport: Airport.find(i+2))
end
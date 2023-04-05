domains
	name = symbol
	phone,city,street,mark,color = string
	house,flat,cost,number = integer
	address = adr(city, street, integer, integer) 
	
predicates
	record(name, phone, address)
	auto(name, mark, color, cost, number)
	question(mark, color, name, phone, city)
	request(color, phone)

clauses
	record(petrov, "+7 956", adr("Moscow", "Central", 23, 15)).
	record(petrov, "+7 782", adr("Moscow", "Central", 23, 15)).
	record(ivanov, "+7 613", adr("St.Petersburg", "Nevskaya", 52, 143)).
	record(ivanov, "+7 402", adr("Moscow", "Central", 23, 92)).
	record(smirnov, "+7 583", adr("St.Petersburg", "Volnaya", 123, 52)).
	record(trunov, "+7 198", adr("Vologda", "Ryzhskaya", 19, 42)).
	
	auto(petrov, "Volvo", "Black", 50, 322).
	auto(petrov, "Nissan", "White", 60, 342).
	auto(smirnov, "Lada", "Blue", 10, 583).
	auto(trunov, "Nissan", "Blue", 70, 893).
	auto(ivanov, "Toyota", "Red", 50, 967).
	
	request(Mark, Color, Name, Phone, City):-
		auto(Name,Mark, Color,_,_), 
		record(Name, Phone, adr(City,_,_,_)).

goal
	
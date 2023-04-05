domains
	name = symbol
	phone = string
	
	city = string	
	street = string
	house = integer
	flat = integer
	address = adr(city, street, integer, integer) 
	
	mark = string
	color = string
	cost = integer
	number = integer
	
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
	
	question(Mark, Color, Name, Phone, City):-
		auto(Name,Mark, Color,_,_), 
		record(Name, Phone, adr(City,_,_,_)).
		
	request(Color, Phone):-
		auto(Name,_,Color,_,_),
		record(Name, Phone, adr(_,_,_,_)).

goal
	%auto(Name,Mark, _, 50, _).
	%auto(Name,"Nissan", "White",_,_), record(Name, Phone, adr(City,_,_,_)).
	%question("Nissan", "White", Name, Phone, City).
	request("White", Phone).
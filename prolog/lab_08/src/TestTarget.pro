domains
	name = symbol
	phone,city,street,mark,color = string
	house,flat,cost,number,size, speed = integer
	address = adr(city, street, integer, integer) 
	owned = 
		auto(mark, color, cost, number);
		building(cost, address);
		land(cost, size);
		vehicle(cost, speed).
	
predicates
	nondeterm record(name, phone, address)
	nondeterm ownership(name, owned)
	nondeterm request(Mark, Color, Name, Phone, City)
	

clauses
	record(petrov, "+7 956", adr("Moscow", "Central", 23, 15)).
	record(petrov, "+7 782", adr("Moscow", "Central", 23, 15)).
	record(ivanov, "+7 613", adr("St.Petersburg", "Nevskaya", 52, 143)).
	record(ivanov, "+7 402", adr("Moscow", "Central", 23, 92)).
	record(smirnov, "+7 583", adr("St.Petersburg", "Volnaya", 123, 52)).
	record(trunov, "+7 198", adr("Vologda", "Ryzhskaya", 19, 42)).
	
	ownership(petrov, auto("Volvo", "Black", 50, 322)).
	ownership(petrov, auto("Nissan", "White", 60, 342)).
	ownership(smirnov, auto("Lada", "Blue", 10, 583)).
	ownership(trunov, auto("Nissan", "Blue", 70, 893)).
	ownership(ivanov, auto("Toyota", "Red", 50, 967)).
	
	request(Mark, Color, Name, Phone, City):-
		ownership(Name,auto(Mark, Color,_,_)), 
		record(Name, Phone, adr(City,_,_,_)).

goal
	request("Nissan",_,Name,_,_).
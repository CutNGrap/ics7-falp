domains
 	intlist = integer*
	name, nick = symbol
	phone,city,street,mark,color, terrain = string
	house,flat,cost,number,size, speed,sum = integer
	address = adr(city, street, house, flat) 
	costlist = cost*
	owned = 
		auto(nick, mark, color, cost, number);
		building(nick,cost, color, size);
		land(nick, cost,terrain, size);
		wvehicle(nick, cost,mark, speed).
	
predicates
	record(name, phone, address)
	ownership(name, owned)
	tmpstr(Name, Nick, Cost)
	all_own(Name, Nick)
	all_own_cost(Name, Nick, Cost)
	all_own_sum_cost(Name, Sum)
	sumlist(costlist, sum)
	

clauses
	record(petrov, "+7 956", adr("Moscow", "Central", 23, 15)).
	record(petrov, "+7 782", adr("Moscow", "Central", 23, 15)).
	record(ivanov, "+7 613", adr("St.Petersburg", "Nevskaya", 52, 143)).
	record(ivanov, "+7 402", adr("Moscow", "Central", 23, 92)).
	record(smirnov, "+7 583", adr("St.Petersburg", "Volnaya", 123, 52)).
	record(trunov, "+7 198", adr("Vologda", "Ryzhskaya", 19, 42)).
	
	ownership(petrov, auto(car,"Volvo", "Black",50, 322)).
	ownership(petrov, auto(automobile,"Nissan", "White",60, 342)).
	ownership(smirnov, auto(car1,"Lada", "Blue",10, 583)).
	ownership(trunov, auto(car2,"Nissan", "Blue",70, 893)).
	ownership(ivanov, auto(car3,"Toyota", "Red",50, 967)).
	
	ownership(trunov, building(shop,12,"Green", 50)).
	ownership(trunov, land(dacha,80,"Forest", 215)).
	ownership(trunov,wvehicle(scooter,7,"Volvo", 20)).
	ownership(ivanov,wvehicle(sea_scooter,12,"Nissan", 30)).
	
	tmpstr(Name, Nick, Cost):-
		ownership(Name,auto(Nick,_,_,Cost,_));
		ownership(Name,building(Nick,Cost,_,_));
		ownership(Name,land(Nick,Cost,_,_));
		ownership(Name,wvehicle(Nick,Cost,_,_)).
	
	sumlist([],0).
	sumlist([H|T],Sum):-
        	sumlist(T,S1),
        	Sum=H+S1.
	
	all_own(Name, Nick):-
		tmpstr(Name,Nick,_).
	all_own_cost(Name, Nick, Cost):-
		tmpstr(Name,Nick,Cost).
		
	all_own_sum_cost(Name, Sum):-
		findall(Cost,tmpstr(Name,_,Cost),L),
		write(L),nl,
		sumlist(L,Sum).

	

goal
	%all_own(trunov, Nick).
	%all_own_cost(trunov, Nick, Cost).
	all_own_sum_cost(trunov, Sum).
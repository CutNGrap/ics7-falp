domains
 	name = symbol
	
predicates
	mom(name, name)
	dad(name,name)
	all_grands(name,name,name,name,name)
	

clauses
	mom(alex,helen).
	mom(ana,kristy).
	mom(helen, angela).
	mom(yura, tanya).
	
	dad(alex,yura).
	dad(ana,yura).
	dad(helen, kiril).
	dad(yura,pasha).

	

goal
	dad(alex,Name).
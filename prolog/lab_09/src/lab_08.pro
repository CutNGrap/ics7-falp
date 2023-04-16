domains
 	name, gen = symbol %gen = gender
	per = per(name, gen) %per = person
	
predicates
	parent(per, per)
	grands(name,name,gen,gen)
	
	max(real,real,real)
	max_cut(real,real,real)
	max(real,real,real,real)
	max_cut(real,real,real,real)
	

clauses
	parent(per(alex, m),per(helen, f)). %helen is mother of alex
	parent(per(helen, f),per(angela,f)).
	parent(per(helen, f), per(kiril,m)).
	parent(per(alex, m),per(yura,m)). %yura is father of alex
	parent(per(yura, m), per(tanya,f)).
	parent(per(yura, m),per(pasha,m)).
	
	parent(per(ana, f),per(kristy,f)).
	parent(per(kristy, f), per(alina,f)).
	parent(per(ana, f),per(oleg,m)).
	parent(per(oleg, m), per(igor,m)).

	%name, name of grandparent, gender of parent, gender of grandparent
	grands(Name, GParent,ParGen, GParGen):-
		parent(per(Name,_), per(Parent,ParGen)),
		parent(per(Parent,ParGen), per(GParent, GParGen)).


	max(X,Y,X):- X>=Y.
	max(X,Y,Y):- X<Y.
	
	max_cut(X,Y,X):- X>=Y,!.
	max_cut(_,Y,Y).
	
	max(X,Y,Z,X):- X>=Y, X>=Z.
	max(X,Y,Z,Y):- Y>=X, Y>=Z.
	max(X,Y,Z,Z):- Z>=X, Z>=Y.
	
	max_cut(X,Y,Z,X):- X>=Y, X>=Z,!.
	max_cut(_,Y,Z,Y):- Y>=Z,!.
	max_cut(_,_,Z,Z).
	
	
goal
	
	%grands(alex,GParent,_,f). %all grandmas
	%grands(alex,GParent,_,m). %all grandpas
	%grands(alex,GParent,_,_). %all grandparents
	%grands(alex,GParent,f,f). %maternal grandma
	%grands(alex,GParent,f,_). %maternal grandparents
	
	%max(1, 2, Max).
	%max(2, 1, Max).
	
	%max_cut(3,5, Max).
	%max_cut(5,3, Max).
	
	%max(1,2,3,Max).
	%max(3,1,2,Max).
	%max(2,3,1,Max).
	
	%max_cut(1,2,3,Max).
	%max_cut(3,1,2,Max).
	max_cut(2,3,1,Max).
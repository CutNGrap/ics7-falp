domains
 	name, gen = symbol %gen = gender
 	n = integer
	per = per(name, gen) %per = person
	
predicates
	parent(per, per)
	grands(name,name,gen,gen)
	
	nparent(name, name, n, gen)
	
	spouse(per, per)
	sibling(name,name,gen)
	parent_in_law(name,name,gen)
	unty(name, name, gen)
	bastard(name, name, gen)
	
	max(real,real,real)
	max_cut(real,real,real)
	max(real,real,real,real)
	max_cut(real,real,real,real)
	

clauses
	parent(per(alex, m),per(helen, f)). %helen is mother of alex
	parent(per(eugene,m), per(helen,f)).
	parent(per(helen, f),per(angela,f)).
	parent(per(helen, f), per(kiril,m)).
	parent(per(angela, f), per(yulia, f)).
	parent(per(alex, m),per(yura,m)). %yura is father of alex
	parent(per(yura, m), per(tanya,f)).
	parent(per(yura, m),per(pasha,m)).
	
	parent(per(pavel, m), per(alex, m)).
	parent(per(eugene,m), per(steve,m)).
	
	parent(per(ana, f),per(kristy,f)).
	parent(per(kristy, f), per(alina,f)).
	parent(per(ana, f),per(oleg,m)).
	parent(per(oleg, m), per(igor,m)).
	
	spouse(per(alex,m),per(ana,f)).
	spouse(per(helen, f),per(yura,m)).

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
	
	nparent(Name, PName, 1, PGender):-
		parent(per(Name,_), per(PName, PGender)).
		
	nparent(Name, PName, N, PGender):-
		parent(per(Name,_), per(Temp,_)),
		T=N-1,
		nparent(Temp, PName, T, PGender).
		
	
	sibling(Name1, Name2, Gen):-
		parent(per(Name1, _), per(Parent,_)),
		parent(per(Name2,Gen), per(Parent,_)),
		not(Name1=Name2),!.
		
	sibling(Name1,Name2, Gen):- sibling(Name2, Name1, Gen).
	
	parent_in_law(Name, PName, Gen):-
		spouse(per(Name, _), per(Spouse,_)),
		parent(per(Spouse,_),per(PName, Gen)).
	
	unty(Name,Unty, Gen):- 
		parent(per(Name,_), per(Parent, _)),
		sibling(Parent, Unty, Gen).
		
	bastard(Name1, Name2, Gen):-
		parent(per(Name1, _), per(Parent1,_)),
		spouse(per(Parent1,_), per(Parent2,_)),
		parent(per(Name1, _), per(Parent2,_)),
		
		parent(per(Name2,Gen), per(Parent1,_)),
		not(parent(per(Name2,Gen), per(Parent2,_))),
		not(Name2=Name1).
		
	%nsibling(Name1, Name2, N, Gen1):-
	
	
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
	%max_cut(2,3,1,Max).
	
	
	%nparent(alex, PName, 3, f).
	%sibling(alex,Sibling, _).
	%sibling(Sibling,alex, _).
	%parent_in_law(alex, PName, f).
	%unty(pavel, Unty, _).
	bastard(alex, Bastard,_).
	
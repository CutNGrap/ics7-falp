domains
 	list = integer*.
 	int = integer.
	
predicates
	len(list, int)
	len(list, int, int)
	
	sum(list, int)
	sum(list, int, int)
	
	sum_odd(list, int)
	sum_odd(list, int, int)

clauses

	len(List, N):-
		len(List, N, 0).
	len([], N, N).
	len([_|T], N, I):-
		I1 = I + 1,
		len(T, N, I1).
		
	
	sum(List, N):-
		sum(List, N, 0).	
	sum([], N, N).
	sum([H|T], N, Sum):-
		Tmp = Sum + H,
		sum(T, N, Tmp).
	
	sum_odd(List, N):-
		sum_odd(List, N, 0).	
	sum_odd([], N, N).
	sum_odd([_|[]], N, N).
	sum_odd([_, Odd|T], N, Sum):-
		Tmp = Sum + Odd,
		sum_odd(T, N, Tmp).
[Sus, aboba]
	
goal
	%len([1, 2 , 3, 4, 5, 6], L].
	%sum([1, 2, 3, 4, 5], Sum).
	sum_odd([0,1,2,3,4,5,6,7], Sum).
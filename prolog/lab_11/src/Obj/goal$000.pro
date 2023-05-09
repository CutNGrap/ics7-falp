domains
 	int = integer.
 	list = int*.
	
predicates
	len(list, int)
	len(list, int, int)
	
	sum(list, int)
	sum(list, int, int)
	
	sum_odd(list, int)
	sum_odd(list, int, int)
	
	bigger_list(list, int, list)
	
	delete_elem_all(list, int, list)
	delete_elem_once(list, int, list)

	list_cnt(list,list,list)
	
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
		
	bigger_list([], _,[]):-!.
	bigger_list([H|T], Num, Res):-
		H <= Num,
		bigger_list(T, Num, Res).
	bigger_list([H|T], Num, [H|Res]):-
		H > Num,
		bigger_list(T, Num, Res).
		
	delete_elem_all([], _,[]):-!.
	delete_elem_all([Num|T], Num, Res):- %equal
		!,delete_elem_all(T, Num, Res).
	delete_elem_all([H|T], Num, [H|Res]):- %not equal
		delete_elem_all(T, Num, Res).
		
	delete_elem_once([], _,[]):-!.
	delete_elem_once([Num|T], Num, T):-!. %equal
		%!,delete_elem_once(T, Num, Res).
	delete_elem_once([H|T], Num, [H|Res]):- %not equal
		delete_elem_once(T, Num, Res).
		
	list_cnt([], L, L):-!.
	list_cnt([H|T], L, [H|Result]):-
		list_cnt(T, L, Result).
	
goal
	%len([1, 2 , 3, 4, 5, 6], L].
	%sum([1, 2, 3, 4, 5], Sum).
	%sum_odd([0,1,2,3,4,5,6,7], Sum).
	%bigger_list([0,1,2,3,4,5,6,7], 3, List).
	%delete_elem_all([0,1,3,4,3,5], 3, List).
	%delete_elem_once([0,3,1,3,3], 3, List).
	list_cnt([1,2,3],[4,5,6], List).
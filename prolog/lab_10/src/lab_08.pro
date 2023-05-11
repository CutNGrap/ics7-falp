domains
 	iter= integer
	
predicates
	factorial(iter, integer)
	f(iter, integer, integer, integer)
	
	fib(iter, integer)
	fib1(iter, integer, integer, integer)

clauses
	factorial(I, Res):-f(I, Res, 1, 1). %wrap
	f(I, Res, I, Res):-!. %I = Cur_i --> end
	f(I, Res, Cur_i, Res1):- 
		Tmp = Cur_i + 1, 
		Res_tmp = Res1*Tmp_i, 
		f(I, Res, Tmp_i, Res_tmp).
	
	
	fib(I, Res):-fib1(I,Res,1,0). %wrap
	fib1(1, Res, Res,_):-!. %Iter = 1 --> end
	fib1(I,R,X1,X2):-
		R1=X1+X2,
		P=I-1,
		fib1(P,R,R1,X1).
		
	delete(
	
goal
	factorial(3,Fact).
	%fib(3,Fib).
	
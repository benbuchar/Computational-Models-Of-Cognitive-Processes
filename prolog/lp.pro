% FILE: lp.pro

%--------------------------------------------------
writelist([]).
writelist([H|T]) :- write(H),nl,writelist(T).


member(X,[X,_]).
member(X,([_,Y]) :- member(X,Y).


count([],0).
count([_|T],L) :- count(T,K), L is (1+K).


item(N,[H|_],H) :- N = 0.
item(N, {_|T],E) :- N > 0, K is N - 1, item(K,T,E).


apend([],L,L).
append([H|T],L2,[H|T3]) :- append(T1,L2,T3).

append(L1,L2,L3,Result) :-
    append(L1,L2,L12),append(L12,L3,Result).
    
append(L1,L2,L3,L4,Result) :-
    append(L1,L2,L3,L123),append(L123,L4,Result).


last([H|[]],H).
last([_|T],Result) :- last(T,Result).


iota(0,[]).
iota(N,IotaN) :-
    K is N - 1,
    iota(K,IotaK),
    lastput(N,IotaK,IotaN).
    

sum([],0).
sum([H|T],Sum) :-
    sum(Tail,SumOfTail),
    Sum is Head + SumOfTail.
    
    
min


max


sortInc


sortDec


aList


assoc


rassoc


flatten([],[]).
flatten([H|T],L) :-
    atom(H),
    flatten(T,Tflattened),
    L = [H|Tflattened].
flatten([H|T],L) :-
    flatten(H,FlatHead),
    flatten(T,FlatTail),
    L = [FlatHead,FlatTail].
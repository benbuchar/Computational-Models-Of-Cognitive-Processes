%FILE: gv.pro
%TYPE: Prolog source
%LINE: very simple global variable ADT
%DATE: September, 2015

declare(Var,Val) :-
	retract(binding(Var,_)),
	assert(binding(Var,Val)).
declare(Var,Val) :-
	assert(binding(Var,Val)).
	
bind(Variable,Value) :-
	retract(binding(Variable,_)),
	assert(binding(Variable,Value)).

valueOf(Variable,Value) :-
	binding(Variable,Value).

undeclare(Var) :-
	retract(binding(Var,_)).
	
inc(Variable) :-
	retract(binding(Variable,Value)),
	NewValue is Value + 1,
	assert(binding(Variable,NewValue)).
	
dec(Variable) :-
	retract(binding(Variable, Value)),
	NewValue is Value - 1,
	assert(binding(Variable, NewValue)).
	
add(Variable,Number) :-
	retract(binding(Variable,Value)),
	NewValue is Value + Number,
	assert(binding(Variable, NewValue)).
	
displayBindings :-
	binding(Variable,Value),
	write(Variable),write(' -> '),write(Value),nl,fail.
displayBindings.

prepend(Variable,Value) :- %assume a list!
	retract(binding(Variable,OldValue)),
	NewValue = [Value|OldValue],
	assert(binding(Variable,NewValue)).
	
add(Operand1, Operand2, Result) :-
	valueOf(Operand1,Value1), valueOf(Operand2,Value2),
	Result is Value1 + Value2.
	
sub(Operand1, Operand2, Result) :-
	valueOf(Operand1,Value1), valueOf(Operand2,Value2),
	Result is Value1 - Value2.
	
mul(Operand1, Operand2, Result) :-
	valueOf(Operand1, Value1), valueOf(Operand2,Value2),
	Result is Value1 * Value2.

div(Operand1, Operand2, Result) :-
	valueOf(Operand1, Value1), valueOf(Operand2,Value2),
	Result is Value1 / Value2.
	
pow(Operand1, Operand2, Result):-
	valueOf(Operand1, Value1),
	valueOf(Operand2, Value2),
	Result is Value1 ^ Value2.
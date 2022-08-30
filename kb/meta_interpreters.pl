%
% Basic knowledge for testing purposes
%
a(1).
a(2).
b(2).
c(X, f(X)).



solve1(A) :- A.


%
% Vanilla meta-interpreter
%
solve2(true).
solve2((A,B)) :- solve2(A), solve2(B).
solve2(A) :- clause(A,B), solve2(B).


%
% Vanilla interpreter corrected
%
solve3(true) :- !.
solve3((A,B)) :- !, solve3(A), solve3(B).
solve3(A) :- clause(A,B), solve3(B).


%
% Built-in predicate resolution absorption
%
solve4(true) :- !.
solve4((A, B)) :- !, solve4(A), solve4(B).
solve4(A) :- predicate_property(A,built_in), !, A.
solve4(A) :- clause(A,B), solve4(B).


%
% Occurs-check reification
%
solve5(true) :- !.
solve5((A, B)) :- !, solve5(A), solve5(B).
solve5(A) :- predicate_property(A,built_in), !, A.
solve5(A) :-
	functor(A,F,R),
	functor(B,F,R),
	clause(B,C),
	unify_with_occurs_check(A,B),
	solve5(C).

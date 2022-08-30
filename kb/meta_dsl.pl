%
% Relation alias facility
%
term_expansion(relation_alias(R,A),E) :-
	T1 =.. [A,X,Y],
	T2 = relation(R,X,Y),
	E = goal_expansion(T1,T2).


%
% Expansion for partonomy operator definitions
%
:- dynamic relation/3.

term_expansion(partonomy_operator(F),[O,E]) :-
        O = (:- op(500,xfy,F)),
        T1 =.. [F,X,Y],
        T2 = relation(F,X,Y),
        E = (term_expansion(T1,T2) :-
	    check_irreflexive(F,X,Y),
	     check_asymmetric(F,X,Y)).


%
% Auxiliary predicates
%
check_irreflexive(R,X,Y) :-
        X = Y ->
	throw_error([R, 'must be irreflexive']);
        true.

check_asymmetric(R,X,Y) :-
        apply(R,[Y,X]) ->
	throw_error([R, 'must be asymmetric']);
        true.

throw_error(L) :-
	concat_atom(L,' ',M),
	throw(error(representation_error(M),_)).

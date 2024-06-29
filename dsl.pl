%
% A domain-specific language (DSL) defining taxonomy and partonomy
% operators and rules.
%
:- ensure_loaded('meta_dsl.pl').
:- style_check(-discontiguous).


%
% Taxonomy operators
%
:- op(500,fx,class).
:- op(1200,xfy,<<).

relation_alias(subclass,subclass).

term_expansion(class(X) << Y,[class(X)|T]) :- expand_class_def(X,Y,T).

expand_class_def(X,(A,B),[relation(subclass,X,A)|T]) :-
	check_asymmetric(isa,X,A),
	expand_class_def(X,B,T).
expand_class_def(X,A,[relation(subclass,X,A)]) :- check_asymmetric(isa,X,A).


%
% Partonomy operators
%
partonomy_operator(part_for).
partonomy_operator(has_part).

relation_alias(part_for,pfr).
relation_alias(has_part,hsp). 

:- op(500,xfy,part_of).

term_expansion(X part_of Y,[T1,T2]) :-
	expand_term(X part_for Y,T1),
	expand_term(Y has_part X,T2).


%
% Taxonomy rules
%
isa(X,X).
isa(X,Y) :- subclass(X,Y).
isa(X,Y) :- subclass(X,Z), isa(Z,Y), Z \= Y.

leaf(X) :- class(X), \+ subclass(_,X).

abstract(X) :- class(X), \+ leaf(X).


%
% Partonomy rules
%
part_for(X,Y) :- pfr(X,Y).
part_for(X,Y) :- pfr(X,Z), part_for(Z,Y). 

has_part(X,Y) :- hsp(X,Y).
has_part(X,Y) :- hsp(X,Z), has_part(Z,Y).

part_of(X,Y) :- part_for(X,Y), has_part(Y,X).


%
% Related
%
related(R,X,Y) :- relation(R,X,Y).
related(part_for,X,Y) :- part_for(X,Y).
related(has_part,X,Y) :- has_part(X,Y).
related(part_of,X,Y) :- part_of(X,Y).
related(isa,X,Y) :- isa(X,Y).
related(R,X,Y) :- isa(X,Z), X \= Z, relation(R,Z,Y).
related(R,X,Y) :- has_part(X,Z), relation(R,Z,Y), R \= has_part, X \= Y.

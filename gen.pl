%
% Alternative constraint-specification language definition.
%

%
% Logical operators
%
:- op(900,xfx,=>).
:- op(800,xfy,&).
:- op(300,xfx,:).


%
% Grammar
%
s(P) --> np(X,P1,P), vp(X,P1).

np(X,P1,P) --> det(X,P2,P1,P), n(X,P3), relc(X,P3,P2).
np(X,P,P) --> pn(X).

vp(X,P) --> v(X,Y,P1), np(Y,P1,P).

det(X,P1,P2,exists(X): (P1 & P2)) --> [a].
det(X,P1,P2,all(X): (P1 => P2)) --> [every].

relc(X,P1,P1 & P2) --> prorel, vp(X,P2).
relc(_,P,P) --> [].

prorel --> [that].
prorel --> [which].

n(X,related(isa,X,C),[C|W],W) :- class(C).

pn(X,[X|W],W) :- class(X).

v(X,Y,related(R, X, Y),[R|W],W) :- related(R,_,_).

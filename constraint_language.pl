%
% DCG grammar
%
s(P) --> np(X,P1,P), vp(X,P1).

np(X,P1,P) --> det(P2,P1,P), n(X,P3), relc(X,P3,P2).
np(X,P,P) --> pn(X).

vp(X,P) --> v(X,Y,P1), np(Y,P1,P).

det(P1,P2,(P1,P2)) --> [a].
det(P1,P2,\+ (P1,\+ P2)) --> [every].

relc(X,P1,(P1,P2)) --> prorel, vp(X,P2).
relc(_,P,P) --> [].

prorel --> [that].
prorel --> [which].

n(X,(related(isa,X,C),\+ abstract(X)),[C|W],W) :- class(C).

pn(X,[X|W],W) :- class(X).

v(X,Y,related(R,X,Y),[R|W],W) :- related(R,_,_).


%
% Constraint checker
%
constraint(C) :-
        phrase(s(P),C),
	(P ->
	 writeln('Constraint satisfied');
	 writeln('Constraint not satisfied')),
        !.

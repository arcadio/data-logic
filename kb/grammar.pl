%
% Rules
%
s --> np, vp.

np --> det, n, relc.
np --> pn.

vp --> v, np.

relc --> prorel, vp.
relc --> [].


%
% Lexicon
%
det --> [a].
det --> [every].

pn --> n.

prorel --> [that].
prorel --> [which].

n([C|W],W) :- class(C).
n --> [Z], {class(Z)}.

class(substance).
related(isa,_,_).
v([R|W],W) :- related(R,_,_).

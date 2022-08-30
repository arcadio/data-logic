%
% General Constraints
%
constraint([every, exocrine_cell, secretes, a, enzyme]).
constraint([every, endocrine_cell, secretes, a, hormone]).
constraint([every, pancreatic_cell, part_of, pancreas]).


%
% Model-specific Constraints
%
constraint([every, cell, which, part_for, pancreas, secretes, a, substance]).
constraint([pancreas, secretes, every, substance]).
constraint([every, endocrine_cell, which, isa, pancreatic_cell, part_for, endocrine_pancreas]).
constraint([every, exocrine_cell, isa, pancreatic_cell]).

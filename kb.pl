%
% An example knowledge base of pancreatic anatomy. Defines taxonomy,
% partonomy and ad-hoc relations.
%

:- ensure_loaded('dsl.pl').
:- ensure_loaded('constraint_language.pl').
:- style_check(-discontiguous).


%
% Taxonomy
%

% Cell hierarchy
class cell.
class exocrine_cell << cell.
class endocrine_cell << cell.
class pancreatic_cell << cell.
class stem_cell << cell.
class neuronal_Schwann_cell << cell.
class exocrine_pancreatic_cell << exocrine_cell, pancreatic_cell.
class endocrine_pancreatic_cell << endocrine_cell, pancreatic_cell.
class adult_stem_cell << stem_cell.
class embryonic_stem_cell << stem_cell.
class centroacinar_cell << exocrine_pancreatic_cell.
class acinar_cell << exocrine_pancreatic_cell.
class a_cell << endocrine_pancreatic_cell.
class b_cell << endocrine_pancreatic_cell.
class d_cell << endocrine_pancreatic_cell.
class e_cell << endocrine_pancreatic_cell.
class pp_cell << endocrine_pancreatic_cell.

% Substance hierarchy
class substance.
class hormone << substance.
class glucagon << hormone.
class insulin << hormone.
class gastrin << hormone.
class somatostatin << hormone.
class ghrelin << hormone.
class pancreatic_polypeptide << hormone.
class enzyme << substance.
class digestive_enzyme << enzyme.
class bicarbonate_ion << enzyme.

% Isolated classes
class nervous_system.
class pancreas.
class exocrine_pancreas.
class endocrine_pancreas.
class islet_of_Langerhans.
class duct.
class capillary.


%
% Partonomy
%
neuronal_Schwann_cell part_of nervous_system.
exocrine_pancreas part_of pancreas.
endocrine_pancreas part_of pancreas.
centroacinar_cell part_of exocrine_pancreas.
acinar_cell part_of exocrine_pancreas.
exocrine_pancreas has_part duct.
islet_of_Langerhans part_of endocrine_pancreas.
a_cell part_of islet_of_Langerhans.
b_cell part_of islet_of_Langerhans.
d_cell part_of islet_of_Langerhans.
e_cell part_of islet_of_Langerhans.
pp_cell part_of islet_of_Langerhans.
islet_of_Langerhans has_part capillary.


%
% Ad-hoc relations
%
relation(secretes, centroacinar_cell, digestive_enzyme).
relation(secretes, acinar_cell, bicarbonate_ion).
relation(secretes, a_cell, glucagon).
relation(secretes, b_cell, insulin).
relation(secretes, d_cell, gastrin).
relation(secretes, d_cell, somatostatin).
relation(secretes, e_cell, ghrelin).
relation(secretes, pp_cell, pancreatic_polypeptide).


/*
my_add(N1, N2, R).
it is true if R unify with 
the sumatory of N1 and N2
*/

my_add(1, N2, N22):- N22 is N2 + 1.

my_add(N1, N2, R2):-
  N12 is N1 - 1, 
  my_add(N12, N2, R),
  R2 is R+1.
  
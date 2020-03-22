/*

Inverting of Lists in Prolog

invert(+List, -Result)

True if result unifies with a list containing list items in reverse order

*/

invert([],[]).                           
invert([Head|Tail], R2):-                  
    invert(Tail, R),
    append(R, [Head], R2).
    
/*

?- listing(invert).
invert([], []).
invert([Head|Tail], R2) :-
    invert(Tail, R),
    append(R, [Head], R2).

true.

?- invert([5, 4, 3, 2, 1], R).
R = [1, 2, 3, 4, 5].

?- time(invert([5, 4, 3, 2, 1], R)).
% 22 inferences, 0.000 CPU in 0.000 seconds (?% CPU, Infinite Lips)
R = [1, 2, 3, 4, 5].

?- 

*/
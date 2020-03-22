/*

Concatenation of Lists in Prolog

concatenate(+List1, +List2, -Result)

true if result contains items in list1 followed by items in list 2 in the same order

Principle de Induction
   1) P(n0)
   2) P(n-1) -> P(n)

concatenate([], List2, List2).
concatenate([Head|Tail], List2, [Head|R]):-
    concatenate(Tail, List2, R).
    
List1 = [1, 2, 3] -> [2, 3]
List2 = [4, 5, 6] -> [4, 5, 6]
R = [2, 3, 4, 5, 6]

[Head|Tail] = [1, 2, 3].
Head = 1,
Tail = [2, 3].

[Head|Tail] = [1].
Head = 1,
Tail = [].

[Head|Tail] = [].
false.

*/

concatenate([], List2, List2).

concatenate([Head|Tail], List2, [Head|R]) :-
    concatenate(Tail, List2, R).
    
/*

concatenate([], List2, List2).
concatenate([Head|Tail], List2, [Head|R]) :-
    concatenate(Tail, List2, R).

true.

?- concatenate([1, 2, 3], [4, 5, 6], R).
R = [1, 2, 3, 4, 5, 6].

?- concatenate([], [4, 5, 6], R).
R = [4, 5, 6].

?- concatenate([1, 2, 3], L2, [1, 2, 3, 4, 5, 6]).
L2 = [4, 5, 6].

?- concatenate([1], L2, [1, 2, 3, 4, 5, 6]).
L2 = [2, 3, 4, 5, 6].

?-

*/
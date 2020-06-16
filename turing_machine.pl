/*  

Program simulating the operation of a Turing machine.

The transition table is defined in code, while tape status is an argument of the predicate. 

Another argument is the number of iterations to be made. The algorithm write all states in which the machine and the contents of the tape were found.

*/

% Turing machine - definition of transition function by format
% (State, ReadSymbol, NewState, WriteSymbol, Direction)

d(s, a, 1, b, r).
d(d, b, 2, a, r).
d(1, a, 1, b, l).
d(1, b, k, a, r).
d(2, a, k, b, r).
d(2, b, 2, a, l).

% additional predicates

invert([], []).
invert([X|Xs], Zs) :- invert(Xs, Ys), join(Ys, [X], Zs).

join([], List, List).
join([H|T], List,[H|Res]) :- join(T, List, Res).

% end of the additional predicates

% moving right along the tape
% when the tape "ends", it adds blank elements

tape([], 1, [], [.], []).
tape([], Pos, [.|L], H, R) :- Pos > 1,
                              PosTmp is Pos -1,
                              tape([], PosTmp, L, H, R).

% when the tape is not "finished" - it uses elements that are

tape([HT|TT], 1, [], HT, TT).
tape([HT|TT], Pos,[HT|L], H, R) :- Pos > 1, 
                                   PosTmp is Pos -1,
                                   tape(TT, PosTmp, L, H, R).

% move left on the tape
% turn the tape around and use the rules to move right then turn around
% and replace the results

tape(List, -1, RRev, H, L) :- invert(List, RevList),
                              tape(RevList, 1, L, H, R),
                              invert(R, RRev).
tape(List, Pos, RRev, H, LRev) :- Pos < -1,
                                  PosTmp is Pos * (-1),
                                  invert(List, RevList),
                                  tape(RevList, PosTmp, L, H, R),
                                  invert(L, LRev),
                                  invert(R, RRev).
                                  
turing(_, _, _, 0) :- !.  

turing(Tape, Pos, State, Steps) :- tape(Tape, Pos, L, H, R),
                                   d(State, H, NewState, NewSymbol, Dir),
                                   updatePos(Pos, Dir, NewPos),
                                   updateTape(L, NewSymbol, R, NewTape),
                                   returnTape(NewTape, NewPos),
                                   returnState(NewState),
                                   NewSteps is Steps - 1,
                                   turing(NewTape, NewPos, NewState, NewSteps).
                                   
updatePos(P, r, NP) :- NP is P + 1.
updatePos(P, l, NP) :- NP is P - 1.

updateTape(L, NewSymbol, R, NewTape) :- join(L, [NewSymbol], T),
                                        join(T, R, NewTape).
                                        
returnTape(T, P) :- tape(T, P, L, H, R), ret(L), retS(H), ret(R).
ret([]).
ret([H|T]) :- write(H), write(","), ret(T).
retS(X) :- write("|"), write(X), write("|").

returnState(S) :- write(" new state: "), write(S), nl.

/*

?- turing([a,b,a,b,a,a,a,b,a],5,s,3).
a,b,a,b,b,|a|a,b,a, new state: 1
a,b,a,b,|b|b,a,b,a, new state: 1
a,b,a,b,a,|b|a,b,a, new state: k
true

*/
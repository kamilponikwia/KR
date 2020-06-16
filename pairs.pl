pairs([_],[]).
pairs([A,B|T],[[A,B]|T1]):-
    pairs([B|T],T1).
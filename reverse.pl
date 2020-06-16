reverse([], A, A).

reverse([Head|Tail], A, R) :- reverse(Tail, A,[Head|R]).

/*
Last three concepts: 
- generic trees
- graphs -> paths
- State problems
*/

/*

        1
      / | \ \
     2  3  4 5 
   / | \
  6  7  8 
  */

  tree1(
      t(1, [t(2, [t(6, []), t(7, []), t(8, [])]), t(3, []), t(4, []	), t(5, [])])
      ).
/*
    1
   /|\
  2 3 4 
*/

  tree2(
      t(1,[t(2,[]), t(3, []), t(4, [])])
  ).
  /*

  In binary trees "nil" was a valid tree but in generic trees we
  dont't have something similar

  t(_, []).

  t( )  -> Tree
  
  []    -> List 
  */

  /*
  member(+E, +Tree)
  it is true if element E is a member of 
  generic tree Tree.
  */

  /* one predicate for the tree */

    member(E, t(E,_)).
    member(E, t(Label, ListOfTrees)):-
    E \= Label, member(E, ListOfTrees).

  /* one predicate for the list */

/* member(E, []):- false! */

member(E, [HeadTree|_]):-
    member(E, HeadTree).

member(E, [_|TailofTrees]):-
   member(E,TailofTrees).

/* Head = t(Label, [...]) */
/* Tail = [] or [t(Label, [...], t( , [..], ..]))] */


/*
leafs(+Tree, -ListOfLeafts)
it is true if ListOfLeafs unify with the list of labels in Tree leafs.
*/

/* one predicate for the tree */

leafs(t(E,[]),[E]).
leafs(t(_, ListOfTrees), R) :- 
    ListOfTrees \= [], 
	leafs(ListOfTrees, R ).

/* one predicate for the list */

leafs([],[]).
leafs([Head|Tail], R3 ):- 
    leafs(Head, R), 
	leafs(Tail, R2), 
	append(R, R2, R3).

/* count(Tree, N)
    it is tre if N unify with the number
	of elements in Tree
*/

/* predicate for trees */
count(t(_,[]), 1).
count(t(_, ListOfTree), R2) :- 
    ListOfTree \= [], 
    count(ListOfTree, R),
	R2 is R + 1.
	
/* predicate for list of trees */
count([], 0).
count([Head|Tail], R3):-
   count(Head, R),
   count(Tail, R2),
   R3 is R + R2. 

/* add(+Tree, -R)
   it is true if R unify with the result
   of adding all values in Tree labels.
   All labels in Tree are numbers.
*/

/* predicate for trees */

/* predicate for list of trees */





  
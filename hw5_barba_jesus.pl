% Jesus Barba CS471-HW5
% --------------------------------

% 1. listLen - find the length of given list
listLen(0, []).
listLen(X, [_|T]) :- listLen(N, T), X is N+1.
?- listLen(X, [1,2,3,4]). % should be 4.

% 2. dropK - remove Kth element from list
dropK(T, [H|T], 1).
dropK([H|S], [H|T], K) :- K1 is K-1, dropK(S, T, K1).
?- dropK(X, [6,3,5,2,8], 2).

% 3. divide - given index X and list L, function creates lists L1 [0:x] and L2 [x+1:]
 divide(Left, Right, List, Index) :-   
    length(Left,Index),
    append(Left,Right,List).
?-divide(X, Y, [3,1,9,5,8], 3).

% 4. createListRange - given 2 numbers X and Y (x<=Y), creates list that includes numbers from X to Y.
createListRange(X,X,[X]) :- !.
createListRange(X,Y,[X|Xs]) :-
    X =< Y,
    Z is X+1,
    createListRange(Z,Y,Xs).
?- createListRange(10, 15, L).
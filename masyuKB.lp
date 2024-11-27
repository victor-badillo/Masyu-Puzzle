%Victor Nathanael Badillo Aldama y Diego Dopazo Garcia
row(0..n-1).
col(0..n-1).
point( (X,Y) ) :- row(X), col(Y).

adj( (X,Y), (X,Y + 1)) :- row(X), col(Y), col(Y + 1). 
adj( (X,Y), (X + 1,Y)) :- row(X), col(Y), row(X + 1). 

{edge(P,Q)} :- adj(P,Q). 
edge(Q,P) :- edge(P,Q).

used(P) :- edge(P,_). 
:- used(P), #count{Q: edge(P,Q)} != 2.

circle((X/n,X\n)) :- black(X).
circle((X/n,X\n)) :- white(X).
:- circle(X), not used(X).

reach (X, Y) :- edge (X, Y).
reach (X, Z) :- edge (Y, Z), reach(X, Y).

:-circle(X), used(P), not reach(X, P), X!=P.

whitecond(B)   :- circle(B), edge (B, (X1, Y1)), edge (B, (X2, Y2)), |Y1-Y2| == 2.
whitecond(B)   :- circle(B), edge (B, (X1, Y1)), edge (B, (X2, Y2)), |X1-X2| == 2.

:- white(X), not whitecond((X/n,X\n)).
:- black(X), whitecond((X/n,X\n)).


blackcond ((X1,Y1)) :- circle((X1,Y1)), edge((X1,Y1), C), edge(C, (X2,Y2)), |Y1-Y2| == 2, X1==X2, Y1!=Y2, edge((X1,Y1), B), edge(B, (X3,Y3)), |X1-X3| == 2, Y1==Y3, X1!=X3.

wcond ((X1,Y1)) :- circle((X1,Y1)), edge((X1,Y1), C), edge(C, (X2,Y2)),
    X1==X2, Y1!=Y2, edge((X1,Y1), B), edge(B, (X3,Y3)), 
    |Y2-Y3| >= 4, X1==X3, Y1!=Y3.

wcond ((X1,Y1)) :- circle((X1,Y1)), edge((X1,Y1), C), edge(C, (X2,Y2)),
    Y1==Y2, X1!=X2, edge((X1,Y1), B), edge(B, (X3,Y3)), 
     |X2-X3| >= 4, Y1==Y3, X1!=X3.

:- black(X), not blackcond((X/n,X\n)).
:- white(X), wcond((X/n,X\n)).

seg(N1*n+N2,M1*n+M2) :- edge((N1,N2),(M1,M2)), (N1,N2) < (M1,M2).

#show seg/2.

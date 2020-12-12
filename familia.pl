progenitor(sara,isaque).
progenitor(abraao,isaque).
progenitor(abraao,ismael).
progenitor(isaque,esau).
progenitor(isaque,jaco).
progenitor(jaco,jose).

mulher(sara).
homem(isaque).
homem(abraao).
homem(ismael).
homem(esau).
homem(jaco).
homem(jose).

filho(X,Y) :- progenitor(Y,X),homem(X).
filha(X,Y) :- progenitor(Y,X),mulher(X).

mae(X,Y) :- progenitor(X,Y),mulher(X).

irmao(X,Y) :- progenitor(Z,X),progenitor(Z,Y),homem(X),X\==Y.
irma(X,Y) :- progenitor(Z,X),progenitor(Z,Y),mulher(X),X\==Y.


tio(X,Z) :- irmao(X,Y),progenitor(Y,Z),homem(X).
tia(X,Z) :- irmao(X,Y),progenitor(Y,Z),mulher(X).


avo(X,Y) :- progenitor(X,Z),progenitor(Z,Y).
neto(X,Z) :- avo(Z,X),homem(X).
neta(X,Z) :- avo(Z,X),mulher(X).



ancestral(X,Z) :- progenitor(X,Z).
ancestral(X,Z) :- progenitor(X,Y),ancestral(Y,Z).
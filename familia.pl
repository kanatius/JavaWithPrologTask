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

/* X e Y devem ser diferentes para que irmao(X,X) ou irma(X,X) não dê true*/
irmao(X,Y) :- progenitor(Z,X),progenitor(Z,Y),homem(X),X\==Y. 
irma(X,Y) :- progenitor(Z,X),progenitor(Z,Y),mulher(X),X\==Y.

/*tio deve ser irmao do progenitor de Z*/
tio(X,Z) :- irmao(X,Y),progenitor(Y,Z).

/*tia deve ser irmã do progenitor de Z*/
tia(X,Z) :- irma(X,Y),progenitor(Y,Z).


sobrinho(X,Y) :- (tio(Y,X);tia(Y,X)),homem(X).
sobrinha(X,Y) :- (tio(Y,X);tia(Y,X)),mulher(X).


avo(X,Y) :- progenitor(X,Z),progenitor(Z,Y).

bisavo(X,Y) :- progenitor(X,Z),avo(Z,Y).

/*é neto de Z quando Z é avo de X e X é homem*/
neto(X,Z) :- avo(Z,X),homem(X).

/*é neto de Z quando Z é avo de X e X é mulher*/
neta(X,Z) :- avo(Z,X),mulher(X).


ancestral(X,Z) :- progenitor(X,Z).
ancestral(X,Z) :- progenitor(X,Y),ancestral(Y,Z).
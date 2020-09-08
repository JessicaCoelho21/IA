% 1.1
% filho, casamento, irmao, homem, mulher, etc...
%

%pessoa(nome, genero, ano_nasc, ano_morte).
pessoa(jan, f, 1902, 1982).

homem(john, 1900, 1984).
homem(steve, 1928, 2000).
homem(john2, 1929, 2010).

mulher(jan, 1902, 1982).
mulher(abby, 1952, 2002).
mulher(gabi, 1930, 2008).

%filho(filho,pai,mae)
filho(abby, john, jan).
filho(john2, john, jan).
filho(fae, steve, abby).

casamento(john, jan).
casamento(steve, abby).
casamento(john2, gabi).

irmao(X, Y):-filho(X,P,M),filho(Y,P,M),X\==Y.

%

%avô materno (masculino)
avo_materno(X,Y):-filho(Y,_,M),filho(M,X,_).


avo(X, Y):-filho(Y, P, M),(filho(P,X,_);filho(P,_,X);
                          filho(M,X,_); filho(M,_,X)).
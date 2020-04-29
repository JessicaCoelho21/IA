%fica(cidade,país) -> a cidade c fica no país p
fica(porto,portugal).
fica(lisboa,portugal).
fica(coimbra,portugal).
fica(caminha,portugal).
fica(madrid,espanha).
fica(barcelona,espanha).
fica(zamora,espanha).
fica(orense, espanha).
fica(toledo, espanha).
fica(braga, portugal).

%passa(rio,cidade)
passa(douro,portp).
passa(douro,zamora).
passa(tejo,lisboa).
passa(tejo,toledo).
passa(minho,caminha).
passa(minho,ourense).

rio_portugues(R):-passa(R,X),fica(X,portugal).
banhadas_mesmo_rio(C1,C2):-passa(R,C1),passa(R,C2),C1\==C2.

%filhos, casamento, irmãos, homem, mulher, ano_nascimento, ano_morte
%avós, bisavós, netos, bisnetos, cunhado, sogro, nora...
%

%pessoa(nome, género, ano_nascimento, ano_morte).
%pessoa(jan, f, 1902, 1982).

homem(john, 1900, 1984).
homem(steve, 1928, 2000).
homem(john2, 1929, 2010).
%homem(mark, 1959,_).

mulher(jan, 1902, 1982).
mulher(abby, 1952, 2002).
mulher(gabi, 1930, 2008).
mulher(fae, 1952, _).

%filho(filho, pai, mãe)
filho(abby, john, jan).
filho(john, john, jan).
filho(fae, steve, abby).

%casamento(homem, mulher).
casamento(john, jan).
casamento(steve, abby).
casamento(john2, gabi).

irmao(X,Y):-filho(X,P,M),filho(Y,P,M),X\==Y.

%avo(avo,neto) (avó ou avô)

%avô materno (masculino)
avo_materno(X,Y):-filho(Y,_,M),filho(M,X,_).

%avô (homem ou mulher, materno ou paterno)
avo(X,Y):-filho(Y,P,M),(filho(P,X,_);filho(P,_,X);
                       filho(M,X,_);filho(M,_,X)).

morto(X):-(homem(X,_,Ano);mulher(X,_,Ano)), Ano < 2020.

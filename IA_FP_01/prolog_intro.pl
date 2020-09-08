%fica(cidade, pais) -> a cidade c fica no pais p
fica(porto,portugal).
fica(lisboa,portugal).
fica(coimbra,portugal).
fica(caminha,portugal).
fica(madrid,espanha).
fica(barcelona,espanha).
fica(zamora,espanha).
fica(orense,espanha).
fica(toledo,espanha).
fica(braga,portugal).

%passa(rio, cidade)
passa(douro,porto).
passa(douro,zamora).
passa(tejo,lisboa).
passa(tejo,toledo).
passa(minho,caminha).
passa(minho,orense).

rio_portugues(R):-passa(R,X),fica(X, portugal).
banhadas_mesmo_rio(C1,C2):-passa(R,C1),passa(R,C2),C1\==C2.
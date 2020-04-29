date(METEO, ENCONTRO, DIA, R):- (METEO == quente, typeDateHot(ENCONTRO, DIA, R1), R = R1) , !; (METEO == frio, typeDayCold(ENCONTRO, DIA, R1), R = R1).

 

%parte quente da árvore
typeDateHot(ENCONTRO, DIA, R):- (ENCONTRO == jantar, R = sim), !; (ENCONTRO == disco, typeDayHot(DIA,R1), R = R1).
typeDayHot(DIA, R):- (DIA = semana, R = nao), !; (DIA = fim_semana, R = sim).

 

%parte fria da árvore
typeDayCold(ENCONTRO,DIA, R):- (DIA = semana, R = nao), !; (DIA = fim_semana, typeDateCold(ENCONTRO, R1), R = R1).
typeDateCold(ENCONTRO, R):- (ENCONTRO == jantar, R = nao), !; (ENCONTRO == disco, R = sim).

 

%date(frio,disco,fim_semana,R)
%date(frio,jantar,fim_semana,R)
%date(frio,jantar,semana,R)
%date(frio,disco,semana,R)
%date(quente,jantar,semana,R)
%date(quente,jantar,fim_semana,R)
%date(quente,disco,fim_semana,R)
%date(quente,disco,semana,R)
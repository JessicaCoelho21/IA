%posição(X,Y,inimigo)-> x,y posicoes do inimigo
posicao(10,10,crazy).
posicao(15,15,sittingduck).
posicao(300,300,fire).
%posicao(30,2,ramfire).
%posicao(12,17,target).
%posicao(18,20,trackfire).
%posicao(5,5,tracker).

%minha posição
eu(20,20).

%accuracy(I,P) minha accuracy P, contra o enimigo I
accuracy(crazy,20).
accuracy(sittingduck,50).
accuracy(fire,90).
accuracy(ramfire,5).
accuracy(target,100).
accuracy(trackfire,75).
accuracy(tracker,40).

%disparo(Inimigo,acertou) -> disparo feito contra um inimigo, acertou/errou
disparo(crazy,hit).
disparo(sittingduck,no).
disparo(fire,hit).
disparo(ramfire,no).
disparo(target,hit).
disparo(trackfire,no).
disparo(tracker,hit).

%velocidadeF(robo,X)
velocidadeF(crazy,1).
velocidadeF(sittingduck,4).
velocidadeF(fire,3).
velocidadeF(ramfire,4).
velocidadeF(target,5).
velocidadeF(trackfire,6).
velocidadeF(tracker,7).

%velocidadeT(robo,X)
velocidadeT(crazy,1).
velocidadeT(sittingduck,4).
velocidadeT(fire,3).
velocidadeT(ramfire,4).
velocidadeT(target,5).
velocidadeT(trackfire,6).
velocidadeT(tracker,7).

%distanhcia D que tenho do inimigo I
distancia(I, D) :- eu(X, Y), posicao(IX,IY,I), D is abs((X-IX) + (Y-IY)).

%lista de inimigos
getEnemies(L):-findall(X,posicao(_,_,X),L).

%obtém o numero de inimigos
numeroInimigos(X):-getEnemies(L),numeroInimigos(L,X).
numeroInimigos([],X):- X is 0.
numeroInimigos([_|T],X):-numeroInimigos(T,R),X is R+1.

%obtem a soma das distancias
distanciaTotal(X):-getEnemies(L),distanciaTotal(L,X).
distanciaTotal([],X):- X is 0.
distanciaTotal([H|T],X):-distanciaTotal(T,R),distancia(H,D),X is R+D.

%distanciaMedia(X) -> X distancia media dos inimigos
distanciaMedia(X):-numeroInimigos(EN),distanciaTotal(D),X is D/EN.

%totalInimigos(X) -> X total de Inimigos
totalInimigos(X):-numeroInimigos(X).

%listaDistancias(L) -> lista de distancias de inimigos
listaDistancias(L):-findall(X,(posicao(_,_,Y),distancia(Y,X)),L).

%inimigoProximo(X) -> nome do inimigo mais proximo
inimigoProximo(X):-listaDistancias(L),inimigoProximo(L,MIN),distancia(X,MIN).
inimigoProximo([H|T], MIN):-inimigoProximo(T,H,MIN).
inimigoProximo([], MIN, MIN):- MIN = MIN.
inimigoProximo([T|H], MIN0,MIN):-MIN1 is min(T, MIN0),inimigoProximo(H,MIN1,MIN).

%maisProximoR([],R):- R is 1000.
%maisProximoR([posicao(,,N)|T], R):- maisProximoR(T,R1),distancia(N,D), R is min(D, R1).

%inimigosPerto(D,L) -> lista de inimigos mais perto que a distancia D
inimigosPerto(D,L):-findall(X,(posicao(_,_,X),distancia(X,Y),Y < D),L).


%inimigo cuja a minha eficacia é a melhor
melhoresInimigos(R):- findall(X,(accuracy(X,Y), Y > 75),R).

%disparar(inimigo,disparar,potencia)->
%disparar(IN,DIS,PO):-((accuracy(IN,X),X > 75);(distancia(IN,Y),Y < 100);(IN == sittingduck),PO is 3,DIS='FIRE');

dispararAcc(IN,DIS,PO):-((accuracy(IN,X),X > 75, PO is 3,DIS='FIRE'),! ;(distancia(IN,Y),Y < 100, PO is 3,DIS='FIRE'),! ;(IN == sittingduck, PO is 3,DIS='FIRE')).

dispararvel4(IN,DIS,PO):-((velocidadeF(IN,V), V > 4, PO is 0,DIS='DONT FIRE'),!;(velocidadeT(IN,V2), V2 > 4, PO is 0,DIS='DONT FIRE')).

dispararvel24(IN,DIS,PO):-((velocidadeF(IN,V),  V >= 2, V =< 4, DIS='FIRE'), ( ( distancia(IN,D), D < 200, PO is 2  ), !;(distancia(IN,D), D >= 200, PO is 1)  ),!;
                           (velocidadeT(IN,V2),  V2 >= 2, V2 =< 4, DIS='FIRE'), ( ( distancia(IN,D), D < 200, PO is 2  ), !;(distancia(IN,D), D >= 200, PO is 1)  )).

dispararvel12(IN,DIS,PO):-((velocidadeF(IN,V),  V >= 1, V =< 2, DIS='FIRE'), ( ( distancia(IN,D), D < 200, PO is 3  ), !;(distancia(IN,D), D >= 200, PO is 2)  ),!;
                           (velocidadeT(IN,V2),  V2 >= 1, V2 =< 2, DIS='FIRE'), ( ( distancia(IN,D), D < 200, PO is 3  ), !;(distancia(IN,D), D >= 200, PO is 2)  )).

disparar(IN,DIS,PO):-dispararAcc(IN,DIS,PO),!;dispararvel4(IN,DIS,PO),!;dispararvel24(IN,DIS,PO),!;dispararvel12(IN,DIS,PO).






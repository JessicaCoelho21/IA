%posição(X, Y, inimigo)
posicao(1, 4, 'Tracker').
posicao(2, 7, 'TrackFire').
posicao(5, 2, 'Crazy').
posicao(7, 3, 'SittingDuck').
posicao(6, 6, 'Target').
posicao(9, 7, 'RamFire').
posicao(10, 6, 'Fire').

%eu(X,Y)
eu(1, 1).

%accuracy(inimigo, P)
accuracy('Tracker', 96.0).
accuracy('TrackFire', 96.8).
accuracy('Crazy', 100.0).
accuracy('Target', 100.0).
accuracy('SittingDuck', 92.0).
accuracy('RamFire', 81.8).
accuracy('Fire', 65.8).

%disparo(inimigo, acertou)
disparo('Crazy', hit).
disparo('Tracker', hit).
disparo('TrackFire', hit).
disparo('Target', hit).
disparo('SittingDuck', hit).
disparo('RamFire', hit).
disparo('Fire', no).

%distancia(inimigo, calculo)
Xinimigo(I, H):-head(posicao(H,_,I), H).


second([_, Second| _], Second).
distancia(I, D):-posicao(_,_,I), D is Xinimigo(I, H).


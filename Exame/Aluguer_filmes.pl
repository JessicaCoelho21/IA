%filme(id_filme, titulo, ano, duracao, rating imdb, alugado, idade_recomendada)
filme(1, 'O anel dos senhores', 2018, 201, 2.4, sim, adulto).
filme(2, 'Pirados das caraibas', 2020, 40, 5, sim, adulto).
filme(3, 'Hairy Potte e a câmara dos secretos', 2010, 99, 3, sim, adulto).
filme(4, 'Tony, o ninja das caldas', 2000, 65, 2.5, nao, todos).
filme(5, 'Programar, orar, compilar', 2016, 80,4, nao, todos).

%cliente(id_cliente, nome, idade)
cliente(1, 'Ivone Costa', 18).
cliente(2, 'Eustácio Pereira', 16).
cliente(3, 'Sidone Costa', 22).
cliente(4, 'Marília Capitão', 13).

%aluguer(id_aluguer, id_cliente, id_filme)
aluguer(1, 1, 2).
aluguer(2, 2, 2).
aluguer(3, 4, 3).
aluguer(4, 3, 5).
aluguer(5, 3, 4).

mau_cliente(X):-cliente(C,X,_), not(aluguer(_,C,_)).

quem_alugou(X,Y):-filme(F, X,_,_,_,_,_), aluguer(_,C,F), cliente(C,Y,_).


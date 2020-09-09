%estudante(id, nome, ano letivo, idade)
estudante(1, 'António Silva', 3, 21).
estudante(2, 'Márcia Costa', 2, 20).
estudante(3, 'Josefina Felizbina', 2, 22).
estudante(4, 'Carlota da Costa', 1, 18).
estudante(5, 'Priscila Teodora', 3, 22).

%uc(id, nome)
uc(1, 'inteligencia artificial').
uc(2, 'fundamentos de programacao').
uc(3, 'sistemas apoio à decisao').

%nota(estudante, uc, nota)
nota(1, 1, 18).
nota(2, 1, 15).
nota(3, 1, 8).
nota(4, 1, 2).
nota(5, 1, 12).
nota(1, 2, 15).
nota(2, 2, 14).
nota(3, 2, 13).
nota(4, 2, 20).
nota(5, 2, 11).
nota(3, 3, 13).
nota(4, 3, 20).
nota(5, 3, 11).

inscrito(X,Y):-estudante(I,X,_,_), nota(I,U,_),uc(U,Y).

estudantes(I,Y):-findall(N, (estudante(_,N,_,D), D>=I),Y).

perc_positivas_estudante(X,Y):-C1 is Y+1, estudante(I,X,_,_), nota(I,_,N), N>10, perc_positivas_estudante(X,Y),Y is C1 * 100/Y.

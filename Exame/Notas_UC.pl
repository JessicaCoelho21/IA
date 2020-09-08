%estudante(id, nome, ano_letivo, idade)
estudante(1, 'António Silva', 3, 21).
estudante(2, 'Márcia Costa', 2, 20).
estudante(3, 'Josefina Felizbina', 2, 22).
estudante(4, 'Carlota da Costa', 1, 18).
estudante(5, 'Priscila Teodora', 3, 22).

%uc(id, nome)
uc(1, 'inteligencia artificial').
uc(2, 'fundamentos e programacao').
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

%devolve estudante cuja diferença entre a idade e o número de anos 
%letivos é maior que 19
mau_estudante(X):-estudante(_,X,A,I), T is I-A, T>=19.

%devolve as notas negativas que houve uma uc
negativas_uc(X,Y):-uc(I,X), nota(_,I,Y), Y<10.

%calcula a média de notas de uma uc
%media_uc(X,Y):-uc(I, X), nota(_,I,N), T1 is T+N, C1 is C+1, Y is T1/C1.

%devolve uma lista que contem o nome do estudante e as suas negativas
maus_estudantes(X):-findall([E, N], (estudante(I,E,_,_), nota(I,_,N), N<10), X).

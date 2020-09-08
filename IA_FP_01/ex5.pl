aluno(1,joao,m).
aluno(2,antonio,m).
aluno(3,carlos,m).
aluno(4,luisa,f).
aluno(5,maria,f).
aluno(6,isabel,f).

curso(1,lei).
curso(2,lsirc).
curso(3,lsig).

%disciplina(cod,sigla,ano,curso)
disciplina(1,ed,2,1).
disciplina(2,ia,3,1).
disciplina(3,fp,1,2).

%inscrito(aluno,disciplina)
inscrito(1,1).
inscrito(1,2).
inscrito(5,3).
inscrito(5,5).
inscrito(3,5).
inscrito(3,3).

%nota(aluno,disciplina,nota)
nota(1,1,15).
nota(1,2,16).
nota(1,5,20).
nota(2,5,10).
nota(3,5,8).
nota(3,3,8).

%copia
copia(1,2).
copia(2,3).
copia(3,4).

%alunos nao inscritos a disciplina
naoinscritosDisc(L):-findall(N,(aluno(C,N,_),not(inscrito(C,_))),L),!;L=[].

%alunos nao inscritos a disciplina a contar com disciplina inexistente
naoinscritosDisc2(L):-findall(N,
                              (aluno(C,N,_),(not(inscrito(C,_));(inscrito(C,D),not(disciplina(D,_,_,_))))),
                              L),!;L=[].

%listaDisciplina(L) -> lista L de disciplinas existentes
listaDisciplina(L):- findall(X,disciplina(_,X,_,_),L).

%numeroDisciplinas(X) -> numero X de disciplinas existentes
numeroDisciplinas(X):-listaDisciplina(L),numeroDisciplinas(L,X).
numeroDisciplinas([],X):- X is 0.
numeroDisciplinas([_|T],X):-numeroDisciplinas(T,R),X is R+1.

%notasAluno(X,L) -> lista L de notas de um aluno X a disciplinas inscritas existentes
notasAluno(X,L):-findall(Y,((nota(X,D,Y)),inscrito(X,D),disciplina(D,_,_,_)),L).

%soma das notas
somaNotasAluno(X,_,S):-notasAluno(X,L),somaNotasAluno(L,S).
somaNotasAluno([],0).
somaNotasAluno([H|T],S):- somaNotasAluno(T,R),S is R+H.

%mediaAluno(A,M) -> media M do aluno de ID A
mediaAluno(A,M):-numeroDisciplinas(X),somaNotasAluno(A,_,S),M is S / X.

%Lista de medias
medias(L):- findall(M,(aluno(A,_,_),mediaAluno(A,M)),L).

%numero de medias
numeroMedias(X):-medias(L),numeroMedias(L,X).
numeroMedias([],X):- X is 0.
numeroMedias([_|T],X):-numeroMedias(T,R),X is R+1.

%soma das medias
somaMedias(S):-medias(L),somaMedias(L,S).
somaMedias([],0).
somaMedias([H|T],S):- somaMedias(T,R),S is R+H.

%media das medias
mediaMedias(M):-numeroMedias(X),somaMedias(SM),M is SM/X.

%alunos com medias acima da media geral
maioresMedias(L):- findall(X,(aluno(A,X,_),mediaAluno(A,M),mediaMedias(MM),M is max(M,MM)),L).

%alunos que copiaram
alunosCopiaram(L):- findall(X,(aluno(A,X,_),copia(A,_)),L).

%alunos que copiaram direta e indiretamente
copiaram(L):-findall(N,((copia(ID,_),aluno(ID,N,_));(copia(_,ID),not(copia(ID,_)),aluno(ID,N,_))),L).

%converter lista de numeros a nomes
convertToName([],R):- R=[],!.
convertToName([H|T],R):-convertToName(T,R1),aluno(H,N,_),append(R1,[N],R).





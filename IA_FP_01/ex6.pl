%somar primeiros n naturais
somarNnaturais(0,0):-!.
somarNnaturais(N,R):-N1 is N-1,somarNnaturais(N1,F1),R is N+F1.

%last element
last([X],X).
last([_|T],Y):-last(T,Y).

%beforeLastElement(L,R) L -> Lista, R -> Resultado
beforeLastElement([],[]).
beforeLastElement([H|T],R):- beforeLastElement(T,R1), ( (R1 == [], R = H),!; (tamanho_lista([H|T],S),S == 2, R=H), !; (R=R1)).
%L=[1,2,3], beforeLastElement(L,R).

%obter elemento n
%obterValorDeN(L,O,N,R) l -> Lista , O -> Old value, N -> New Value, R -> Resultado
obterValorDeN(L,P,R):- obterValorDeN(L,P,0,R).
obterValorDeN([],_,_,R):- R = 'Valor não encontrado'.
obterValorDeN([H|T],P,N,R):- ( N==P, R=H),!;(N1 is N+1, obterValorDeN(T,P,N1,R)).
%L=[1,2,2,3], obterValorDeN(L,3,R).

%tamanho da lista
tamanho_lista([],0).
tamanho_lista([_|T], R):-tamanho_lista(T, R1), R is R1+1.

%verificar se variavel é uma lista
verify(X):-is_list(X).

%insert X on list L, resulting on LR
insertEnd(L,X,LR):-append(L,[X],LR).

%concat lists
concatLists(L,X,LR):-append(L,X,LR).

%remove duplicates (using sort)
removeDup(L,X):-sort(L,X).

%duplicar elementos
dupliElements([],[]).
dupliElements([H|T],[H,H|Y]):-dupliElements(T,Y).

%eliminaPosiN(L,N,R) l -> Lista , N -> Posição a remover, R -> Resultado
eliminaPosiN(L,N, R):- eliminaPosiN(L,N,0,R).
eliminaPosiN([],_,_, L):- L =[].
eliminaPosiN([H|T],N,A, L):- A1 is A+1, eliminaPosiN(T,N,A1,L1), (( A == N , L = L1 ),! ; (append([H],L1,L))).
%L=[1,2,3,3,4,5,5,6,7], eliminaPosiN(L,2,L1).

%somaPos(L,R) L -> Lista, R -> Resposta
somPos([],0).
somPos([H|T],R):- somPos(T,R1), ((   H > 0, R is R1+H ),! ; ( R is R1 )).
%L=[1,2,-1,3], somPos(L,R)

%eliminar primeira ocorrencia de um determinado numero
eliminaPrimeiroValorN(L,V, R):- reverse(L,RL), eliminaPrimeiroValorN(RL,V,RR, _), reverse(RR,R).
eliminaPrimeiroValorN([],_, R,F):- R = [], F = false.
eliminaPrimeiroValorN([H|T],V, R, F):- eliminaPrimeiroValorN(T,V,R1,F1), (( F1 == false, H == V , R = R1, F = true),! ; (append([H],R1,R), F = F1)).
%L=[1,3,2,3,4,5,5,6,7], eliminaPrimeiroValorN(L,3,R).


%eliminar ocorrencias de N
%eliminaValorN(L,V,R) l -> Lista , V -> Valor, R -> Resultado
eliminaValorN([],_, R):- R = [].
eliminaValorN([H|T],V, R):- eliminaValorN(T,V,R1), (( H == V , R = R1 ),! ; (append([H],R1,R))).
%L=[1,2,2,3], eliminaValorN(L,2,R).


%substituirValorN(L,O,N,R) l -> Lista , O -> Old value, N -> New Value, R -> Resultado
substituirValorN([],_,_,R):- R = [].
substituirValorN([H|T],O,N, R):- substituirValorN(T,O,N,R1), (( H == O , append([N],R1,R)),! ; (append([H],R1,R))).
%L=[1,2,2,3], substituirValorN(L,2,5,R).

%inserirPosIN(L,R) l -> Lista , R -> Resultado
inserirPosIN(L,N,V,R):- inserirPosIN(L,N,V,0,R).
inserirPosIN([],_,_,_,L):- L =[].
inserirPosIN([H|T],N,V,A, L):- A1 is A+1, inserirPosIN(T,N,V,A1,L1), (( A == N , append([V,H],L1,L)),! ; (append([H],L1,L))).
%L=[1,2,3,3,4,5,5,6,7], inserirPosIN(L,2,5,L1).

%sameElements(L1,L2,R) l1 -> Lista 1 , l2 -> Lista 2, R -> Resultado
sameElements([],_,R):- R = [].
sameElements([H|T],L,R):- sameElements(T,L,R1), ((member(H,L), not(member(H,R1)),append([H],R1,R)),! ; ( R = R1 )).
%L=[1,2,3,3,4,5,5,6,7], L1=[1,2,3,8], sameElements(L,L1,R).




















%Ficha 1, exercício 2
%homem(homem)
homem('Tywin').
homem('Kevan').
homem('Stannis').
homem('Renly').
homem('Robert').
homem('SerJaime').
homem('Tyrion').
homem('Joffrey').
homem('Tommen').
homem('Lancel').
homem('LorasTyrell').
homem('GandorClegane').
homem('SerGregorClegane').
homem('AerysII').
homem('Rhaegar').
homem('Viserys').
homem('KhalDrogo').
homem('Rhaenys').
homem('Aegon').

%mulher(mulher)
mulher('Joanna').
mulher('Dorna').
mulher('Cersei').
mulher('Myrcella').
mulher('Rhaella').
mulher('Elia').
mulher('Daenerys').

%familia(pessoa, familia)
%Lannister
familia('Joanna', 'Lannister').
familia('Tywin', 'Lannister').
familia('Kevan', 'Lannister').
familia('Dorna', 'Lannister').
familia('Cersei', 'Lannister').
familia('SerJaime', 'Lannister').
familia('Tyrion', 'Lannister').
familia('Lancel', 'Lannister').
%Baratheon
familia('Stannis', 'Baratheon').
familia('Renly', 'Baratheon').
familia('Robert', 'Baratheon').
familia('Joffrey', 'Baratheon').
familia('Myrcella', 'Baratheon').
familia('Tommen', 'Baratheon').
familia('GandorClegane', 'Baratheon').
familia('SerGregorClegane', 'Baratheon').
%Targaryen
familia('AerysII', 'Targaryen').
familia('Rhaella', 'Targaryen').
familia('Elia', 'Targaryen').
familia('Rhaegar', 'Targaryen').
familia('Viserys', 'Targaryen').
familia('Daenerys', 'Targaryen').
familia('Rhaenys', 'Targaryen').
familia('Aegon', 'Targaryen').
%sem família
familia('LorasTyrel', _).
familia('KhalDogo', _).

%casados(homem, mulher)
casados('Tywin', 'Joanna').
casados('Kevan', 'Dorna').
casados('Robert', 'Cersei').
casados('AerysII', 'Rhaella').
casados('Rhaegar', 'Elia').
casados('KhalDrogo', 'Daenerys').

%desdendentes diretos(homem, mulher, filho)
descendenteDir('Tywin', 'Joanna', 'Cersei').
descendenteDir('Tywin', 'Joanna', 'SerJaime').
descendenteDir('Tywin', 'Joanna', 'Tyrion').
descendenteDir('Kevan', 'Dorna', 'Lancel').
descendenteDir('Robert', 'Cersei', 'Joffrey').
descendenteDir('Robert', 'Cersei', 'Myrcella').
descendenteDir('Robert', 'Cersei', 'Tommen').
descendenteDir('AerysII', 'Rhaella', 'Rhaegar').
descendenteDir('AerysII', 'Rhaella', 'Viserys').
descendenteDir('AerysII', 'Rhaella', 'Daenerys').
descendenteDir('Rhaegar', 'Elia', 'Rhaenys').
descendenteDir('Rhaegar', 'Elia', 'Aegon').

%irmão(irmão, irmão)
irmao(X,Y):-descendenteDir(P,M,X),descendenteDir(P,M,Y),X\==Y.

%morto(assassino, vítima)
matou('Tyrion', 'Joanna').
matou('SerJaime', 'AerysII').
matou('Robert', 'Rhaegar').
matou('SerGregorClegane', 'Elia').
matou('SerGregorClegane', 'Rhaenys').
matou('SerGregorClegane', 'Aegon').

%inimigo
inimigo('GandorClegane', 'SerGregorClegane').
inimigo('Cercei', 'Tyrion').
inimigo('Tywin', 'Tyrion').

%amigo
amigo('Renly', 'LorasTyrell').

%relação amorosa
relamorosa('SerJaime', 'Cersei').
relamorosa('Renly', 'LorasTyrell').

%filho(pai, filho)
filho(P,F):-descendenteDir(P,_,F), homem(F).

%filha(pai, filha)
filha(P,F):-descendenteDir(P,_,F), mulher(F).

%gay(pessoa)
gay(P):-relamorosa(P,A), homem(P), homem(A);
    relamorosa(A,P), homem(P), homem(A);
    relamorosa(P,A), mulher(P), mulher(A);
    relamorosa(A,P), mulher(P), mulher(A).

%viúvo(pessoa)
viuvo(H):-casados(H,M), matou(_, M), homem(H).

%viúva(pessoa)
viuva(M):-casados(H,M), matou(_, H), mulher(M).

%viúvos amorosos(homem, mulher)
viuvos_amorosos(H,M):-viuvo(H), viuva(M), relamorosa(H,M).

%vingança pendente(pessoa, pessoa)
vinganca_pendente(A,B):-matou(A,_),(casados(_,B);casados(B,_)).

%assassino(pessoa)
assassino(A):-matou(A,_).

%morto(pessoa)
morto(A):-matou(_,A).

%vingou(pessoa, pessoa)
vingou(A,B):-matou(A,_),matou(B,A),(casados(_,B);casados(B,_)).

%descendente(pessoa, pessoa)
%descendente(X,Y):-descendenteDir(Y,_,X);descendenteDir(_,Y,X).
descendente(X,Y):-(descendenteDir(Y,_,Z);descendenteDir(_,Y,Z)), descendente(X,Z).

%infiel(pessoa)
infiel(A):-casados(A,_), relamorosa(A,_);
    casados(_,A), relamorosa(_,A).

%exercício 3
%incesto(homem, mulher)
incesto(H,M):-irmao(H,M), relamorosa(H,M).

%personagens mortas por Tyrion
tyrion_assassino(P):-matou('Tyrion',P).

%personagens da família Targaryen mortas por Ser Jaime
ser_jaime_assassino(P):-matou('SerJaime',P), familia(P,'Targaryen').

%personagens que mataram membros da familia Targaryen
assassinos_targaryen(P):-matou(P,A), familia(A,'Targaryen').

%Filhos de Cercei e Robert
filhos_cersei_robert(P):-descendenteDir('Robert', 'Cersei', P).

%filhos de casamento
filhos_casamento(P):-descendenteDir(_,_,P).

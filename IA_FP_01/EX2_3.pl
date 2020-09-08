%Exercício 2 / 3
%homem(h) -> h é homem
%Baratheon
homem(stanis).
homem(renly).
homem(robert).
homem(joffrey).
homem(tommen).
homem(sandor).
homem(gregor).
%Tyrell
homem(loras).
%Lannister
homem(tywin).
homem(kevan).
homem(jaime).
homem(tyrion).
homem(lancel).
%tragaryen
homem(aerys2).
homem(rhaegar).
homem(viserys).
homem(rhaenys).
homem(aegon).
%dothraki
homem(drogo).

%mulher(m) -> m é mulher
%baratheon
mulher(myrcella).
%lannister
mulher(joanna).
mulher(cersei).
%dorne
mulher(dorna).
%targaryen
mulher(rhaella).
mulher(elia).
mulher(deanerys).

%familia(x,y) -> a pessoa x pertence a familia y
familia(stanis,baratheon).
familia(renly,baratheon).
familia(robert,baratheon).
familia(joffrey,baratheon).
familia(tommen,baratheon).
familia(sandor,baratheon).
familia(gregor,baratheon).
familia(myrcella,baratheon).
familia(loras,tyrell).
familia(tywin,lannister).
familia(kevan,lannister).
familia(jaime,lanister).
familia(tyrion,lanister).
familia(lancel,lannister).
familia(joanna,lannster).
familia(cersei,lannister).
familia(aerys2,targaryen).
familia(rhaegar,targaryen).
familia(viserys,targaryen).
familia(rhaenys,targaryen).
familia(aegon,targaryen).
familia(rhaella,targaryen).
familia(elia,targaryen).
familia(daenerys,targaryen).
familia(drogo,dothraki).
familia(dorna,dorne).


%casados(X,Y) -> a pessoa X é casada com a pessoa Y
casados(robert,cersei).
casados(tywin,joanna).
casados(kevan,dorna).
casados(aerys2,rhaella).
casados(rhaegar,elia).
casados(drogo,daenerys).

%teste viuvos amorosos
%casados(jaime,rhaella).

%descendenteDir(X,Y,Z) -> X e Y são pais de Z
descendenteDir(robert,cersei,joffrey).
descendenteDir(robert,cersei,myrcella).
descendenteDir(robert,cersei,tommen).
descendenteDir(tywin,joanna,cersei).
descendenteDir(tywin,joanna,jaime).
descendenteDir(tywin,joanna,tyrion).
descendenteDir(kevan,dorna,lancel).
descendenteDir(aerys2,rhaella,rhaegar).
descendenteDir(aerys2,rhaella,viserys).
descendenteDir(aerys2,rhaella,daenerys).
descendenteDir(rhaegar,elia,rhaenys).
descendenteDir(rhaegar,elia,aegon).


descendente(X,Y):-descendenteDir(Y,_,X);descendenteDir(_,Y,X).
descendente(X,Y):-(descendenteDir(Y,_,Z);descendenteDir(_,Y,Z)), descendente(X,Z).

%irmao(x,y) -> x é irmao de y se tiverem os mesmos pais
irmao(X,Y):-descendenteDir(P,M,X),descendenteDir(P,M,Y).

%matou(x,y) -> x matou y
matou(tyrion,joanna).
matou(jaime,aerys2).
matou(robert,rhaegar).
matou(gregor,elia).
matou(gregor,rhaenys).
matou(gregor,aegon).

%teste vingança
%matou(aerys2,lancel).

%assassino(x) -> x é assassino
assassino(X):-matou(X,_).

%morto(x) -> a personagem x esta morta
morto(X):-matou(_,X).
morto(rhaella).

%teste viuvos amorosos
%morto(robert).

%inimigo(x,y) -> x é inimigo de y
inimigo(sandor,gregor).

%amigo(x,y) -> x é amigo de y
amigo(loras,renly).

%relamorosa(x,y) -> x mantem relacoes amorosas com y sem compromisso
relamorosa(cersei,jaime).

%relamorosa(loras,renly).

%filho(x,y) -> x é pai de y(masculino)
filho(X,Y):-descendenteDir(X,_,Y),homem(Y).

%filha(x,y) -> x é pai de y(feminino)
filha(X,Y):-descendenteDir(X,_,Y),mulher(Y).

%gay(x) -> x é homosexual
gay(renly).
gay(loras).
gay(X):-relamorosa(X,Y),(homem(X),homem(Y);mulher(X),mulher(Y)).

%viuvo(x) -> x é viuvo
viuvo(X):-casados(X,Y),morto(Y).

%viuva(x) -> x é viuva
viuva(Y):-casados(X,Y),morto(X).

%viuvos_amorosos(X,Y) -> x e y sao viuvos com relacoes amorosas
viuvos_amorosos(X,Y):-(homem(X),mulher(Y);mulher(X),homem(Y)),(viuvo(X),viuva(Y);viuva(X),viuvo(Y)).

%vingança_pendente(X,Y) -> y matou conjugue de X, logo X quer vingança em Y
vingança_pendente(X,Y):-matou(Y,Z),(casados(X,Z);casados(Z,X)).

%vingou(X,Y) -> x vingou a morte de y
vingou(X,Y):-matou(X,Z),matou(Z,Y).


%infiel(X) -> X é infiel, esta casado e anda com outro/a (vivos)
infiel(X):-(casados(X,Y);casados(Y,X)),
    		not(morto(Y)),
            relamorosa(X,Z),
    		not(morto(Z)).
    		
%Questões
%
%aerys esta morto?
%?-morto(aerys2).
%true

%jaime matou aerys?
%?-matou(jaime,aerys2).
%true

%tywin e amigo de tyrion?
%?-amigo(tywin,tyrion).
%false

%Stannis e irmão de renly?
%?-irmao(stannis,renly).
%false

%Existe alguma relação de incesto?
%?-incest(X,Y):-irmao(X,Y).
%true

%Liste descendentes de Tywin Lanister
%descendenteDir(tywin,_,Z).


%Exercicio 3
%Que personagens existem relaçoes de incesto?
%incest(X,Y):-relamorosa(X,Y),irmao(X,Y).

%Que personagens foram mortas por tyrion?
%?-matou(tyrion,X).

%Que personagens foram mortas por jaime da familia targaryen?
%matou(jaime,X):-familia(X,targaryen).

%Que personagens mataram mebros da familia targaryen?
%matoutar(X):-matou(X,Y),familia(Y,targaryen).

% que personagens são resultado do casamento entre Cersei e Robert?
%descendenteDir(robert,cersei,X).

%Determine todos os filhos de todos os relacionamentos de casamento.
%descendenteDir(_,_,X).
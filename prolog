:- style_check(-singleton).
:- dynamic characteristic/2.
:- dynamic character/7.
:- dynamic clearBase/1.
:- dynamic clearBase1/1.
:- dynamic play/0.
:- dynamic play/1.
:- dynamic question_sexo/0.
:- dynamic question_mora/0.
:- dynamic question_trabalha/0.
:- dynamic question_oculos/0.
:- dynamic question_carro/0.
:- dynamic question_bandeirante/0.
:- dynamic question_maravilha/0.
:- dynamic question_seco/0.
:- dynamic question_justo/0.
:- dynamic question_unao/0.
:- dynamic question_violao/0.





characteristic(nothing, y_n).

clearBase(X):- clearBase1(X), fail.
  clearBase(X).

clearBase1(X):- retract(X).
  clearBase1(X).

% Name, Sexo, mora, sysmo, oculos, Carro,bandeirantes,maravilha,seco,justino,unao
%Respostas: Y(Sim) N(Não)

character('Aline',          n,y,y,y,n,n,n,n,n,n,n).
character('Patricia',	    n,n,n,y,n,n,n,n,n,n,n).
character('Jordan',	    y,y,y,n,y,n,n,n,n,n,n).
character('Felipe Amado',   y,y,n,n,n,n,n,n,n,n,n).
character('Jean',	    y,n,n,n,n,n,n,n,n,n,n).
character('Pedro',	    y,n,n,y,n,n,n,n,n,n,n).
character('Anderson',	    y,n,n,y,n,y,n,n,n,n,n).
character('Jonathan',	    y,n,n,y,y,n,y,n,n,n,n).
character('Gabriel',	    y,n,n,n,n,n,y,n,n,n,n).
character('Luiz Seco',      y,y,y,n,n,n,n,y,n,n,n).
character('Luis Justino',   y,y,y,y,n,n,n,n,y,n,n).
character('Henrique',       y,y,y,n,y,n,n,n,n,n,y).
character('Jackson',        y,y,y,n,y,n,n,n,n,y,n).














%character('Jordan',         y, y, n, y, y, y, n, n).
%character('Pedro',      y, n, y, y, n, n, n, n).
%character('Jean',          y, y, y, y, y, n, n, n).
%character('Anderson',          y, n, n, y, y, y, n, n).
%character('Alexandre',  y, y, n, y, y, y, y, n).
%character('Dionatta',          y, y, n, y, n, y, y, n).
%character('Felipe Finger',            y, n, n, n, n, y, y, n).
%character('Felipe Amado',          y, y, y, n, y, n, n, n).
%character('Henrique',            y, n, n, n, y, n, y, n).
%character('Jackson',           y, y, n, n, n, y, y, n).
%character('Joao Paulo',        y, y, n, n, y, y, y, y).
%character('Junior',            y, y, n, n, y, y, n, y).
%character('João vitor',           y, y, y, n, n, n, y, n).
%character('Jonathan',          y, y, y, n, n, n, n, n).
%character('Leonardo',           y, n, y, n, y, y, y, y).
%character('Luis Justino',      y, n, y, n, y, y, n, y).
%character('Luiz Seco',         y, y, y, n, n, y, y, n).
%character('Tiago',           y, y, y, n, n, y, y, y).
%character('Gabriel',           y, y, y, n, n, y, y, y).
%character('Natan',           y, y, y, n, n, y, y, y).




play :-
  clearBase(characteristic(Characteristic, Yn)),
  nl, cls, print_splash, write('\tBem-vindo ao Akinator da Computacao!'), nl, nl,
  question_sexo.

play(y) :-
  play.

play(n) :-
  nl, write('\tObrigado por utilizar o Akinator da Computacao!'), nl, nl, !.

new_round :-
  nl, nl, write('\tVoce gostaria de adivinhar outro personagem (y/n)? '),
	read(Desire),
	play(Desire).

print_splash :-
  write("
\t                                @/
\t              ,#&@@@@@@@@@@(  @@@
\t            &@@@@@@@@@@@@@@@@@@
\t          (@@@@@@@@@@@@@@@@@@@@(
\t          @@@@@@@@@@@@@@@@@@@@@@@@
\t          #@@@@@@@@@@@@@@@@@@@@@@@@
\t            *@@@@@@@@@@@@@@@@@@@@@@@
\t            /@@@@@@@@@@@@@@@@@@@@@@&
\t            .@@@@@@@@@@@@@@@@@@@@@.
\t            /@@@@@@@@@@@@@@@@@@@&
\t            &@@@@@@@@@@@@@@@@@*
\t            .@@@@@@@@@@@@@@@@@
\t            (@@@@@@@@@@@@@@#
\t              &@@@@@@@@@@@@@*
\t                @.%@@@@@@@@@&
\t            #@@@@@@@@@@@@@@@@@&(.
\t          &@@@@@@@@@@@@@@@@@@@@@@@@&,
\t        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
\t      /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(
\t    (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&
\t.&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,
\t&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,
\t*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%
\t.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
\t  %@@@@@&@@@@@@@@@@@@@@@@@@@@&
\t    @@@@@.@@@@@@@@@@@@@@@@@@@@
\t    .@@@* %@@@@@@@@@@@@@@@@@@.
\t      /.  .&&&&&&&&&&&&&&&&%
\t           *##############.\n\n").

cls :-
  format('~c~s', [0x1b, "[2J"]).

question_sexo :-
  write('\tVoce e do sexo masculino (y/n)? '),
  read(AnswerSexo),
  asserta(characteristic(sexo, AnswerSexo)),
   characteristic(sexo, SexoQuery),
  findall(X, character(X, SexoQuery,_,_,_,_,_,_,_,_,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery,_,_,_,_,_,_,_,_,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;
question_mora.
question_mora :-
  cls, print_splash, write('\t Mora em São Miguel do Oeste  (y/n)? '),
  read(Answermora),
  asserta(characteristic(mora, Answermora)),
   characteristic(sexo, SexoQuery),
   characteristic(mora, MoraQuery),
  findall(X, character(X, SexoQuery, MoraQuery,_,_,_,_,_,_,_,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,_,_,_,_,_,_,_,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;

question_trabalha.
question_trabalha :-
  cls, print_splash, write('\t Trabalha na sysmo?(y/n)? '),
  read(Answertrabalha),
  asserta(characteristic(trabalha, Answertrabalha)),
  characteristic(sexo, SexoQuery),
  characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),

  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery,_,_,_,_,_,_,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,_,_,_,_,_,_,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;


  question_oculos.
question_oculos :-
  cls, print_splash, write('\t Usa oculos ?(y/n)? '),
  read(Answeroculos),
  asserta(characteristic(oculos, Answeroculos)),
  characteristic(sexo, SexoQuery),
  characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),
   characteristic(oculos, OculosQuery),


  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery, OculosQuery,_,_,_,_,_,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,OculosQuery,_,_,_,_,_,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;


  question_carro.
question_carro :-
  cls, print_splash, write('\t Tem carro ?(y/n)? '),
  read(Answercarro),
  asserta(characteristic(carro, Answercarro)),
   characteristic(sexo, SexoQuery),
   characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),
   characteristic(oculos, OculosQuery),
   characteristic(carro, CarroQuery),
  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery, OculosQuery,CarroQuery,_,_,_,_,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,OculosQuery,CarroQuery,_,_,_,_,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;

 question_bandeirante.
question_bandeirante :-
  cls, print_splash, write('\t Mora em bandeirantes ?(y/n)? '),
  read(Answerbandeirante),
  asserta(characteristic(bandeirante, Answerbandeirante)),
   characteristic(sexo, SexoQuery),
   characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),
   characteristic(oculos, OculosQuery),
   characteristic(carro, CarroQuery),
   characteristic(bandeirante, BandeiranteQuery),
  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery, OculosQuery,CarroQuery,BandeiranteQuery,_,_,_,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,OculosQuery,CarroQuery,BandeiranteQuery,_,_,_,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;



   question_maravilha.
question_maravilha :-
  cls, print_splash, write('\t Mora em maravilha ?(y/n)? '),
  read(Answermaravilha),
  asserta(characteristic(maravilha, Answermaravilha)),
   characteristic(sexo, SexoQuery),
   characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),
   characteristic(oculos, OculosQuery),
   characteristic(carro, CarroQuery),
   characteristic(bandeirante, BandeiranteQuery),
   characteristic(maravilha, MaravilhaQuery),
  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery, OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,_,_,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,_,_,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;

 question_seco.
question_seco:-
 cls, print_splash, write('\t O bicho é seco?(y/n)? '),
  read(Answerseco),
  asserta(characteristic(seco, Answerseco)),
   characteristic(sexo, SexoQuery),
   characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),
   characteristic(oculos, OculosQuery),
   characteristic(carro, CarroQuery),
   characteristic(bandeirante, BandeiranteQuery),
   characteristic(maravilha, MaravilhaQuery),
   characteristic(seco,SecoQuery),
  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery, OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,SecoQuery,_,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,SecoQuery,_,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;


  question_justo.
question_justo:-
 cls, print_splash, write('\t É conhecido como Justo?(y/n)? '),
  read(Answerjusto),
  asserta(characteristic(justo, Answerjusto)),
   characteristic(sexo, SexoQuery),
   characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),
   characteristic(oculos, OculosQuery),
   characteristic(carro, CarroQuery),
   characteristic(bandeirante, BandeiranteQuery),
   characteristic(maravilha, MaravilhaQuery),
   characteristic(seco,SecoQuery),
   characteristic(justo,JustoQuery),
  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery, OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,SecoQuery,JustoQuery,_,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,SecoQuery,JustoQuery,_,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;

 question_violao.
question_violao:-
 cls, print_splash, write('\t Toca violão  ?(y/n)? '),
  read(Answerviolao),
  asserta(characteristic(violao, Answerviolao)),
   characteristic(sexo, SexoQuery),
   characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),
   characteristic(oculos, OculosQuery),
   characteristic(carro, CarroQuery),
   characteristic(bandeirante, BandeiranteQuery),
   characteristic(maravilha, MaravilhaQuery),
   characteristic(seco,SecoQuery),
   characteristic(justo,JustoQuery),
   characteristic(violao,ViolaoQuery),

  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery, OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,SecoQuery,JustoQuery,ViolaoQuery,_), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,SecoQuery,JustoQuery,ViolaoQuery,_),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;


question_unao.
question_unao :-
  cls, print_splash, write('\t Tem um unao ?(y/n)? '),
  read(Answerunao),
  asserta(characteristic(unao, Answerunao)),
   characteristic(sexo, SexoQuery),
   characteristic(mora, MoraQuery),
   characteristic(trabalha, TrabalhaQuery),
   characteristic(oculos, OculosQuery),
   characteristic(carro, CarroQuery),
   characteristic(bandeirante, BandeiranteQuery),
    characteristic(bandeirante, BandeiranteQuery),
   characteristic(maravilha, MaravilhaQuery),
   characteristic(seco,SecoQuery),
   characteristic(justo,JustoQuery),
   characteristic(violao,ViolaoQuery),

    characteristic(unao,UnaoQuery),

  findall(X, character(X, SexoQuery, MoraQuery,TrabalhaQuery, OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,SecoQuery,JustoQuery,ViolaoQuery,UnaoQuery), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, MoraQuery,TrabalhaQuery,OculosQuery,CarroQuery,BandeiranteQuery,MaravilhaQuery,SecoQuery,JustoQuery,ViolaoQuery,UnaoQuery),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;


cls, print_splash, write('\tArghhh!!! Nao!!!'), new_round.





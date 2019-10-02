:- style_check(-singleton).
:- dynamic characteristic/2.
:- dynamic character/8.
:- dynamic clearBase/1.
:- dynamic clearBase1/1.
:- dynamic play/0.
:- dynamic play/1.
:- dynamic question_sexo/0.
%:- dynamic question_mora/0.
%:- dynamic question_miojo/0.
%:- dynamic question_idade/0.
%:- dynamic question_smo/0.
%:- dynamic question_curso/0.
%:- dynamic question_barba/0.
%:- dynamic question_sysmo/0.

%symbolic fact
characteristic(nothing, y_n).

clearBase(X):- clearBase1(X), fail.
  clearBase(X).

clearBase1(X):- retract(X).
  clearBase1(X).

% Main cast
% Name, Sexo, mora, Miojo, Idade, Smo, Curso, Barba, Sysmo
% Respostas: Y(Sim) N(Não)

character('Aline',          n).
character('Patricia',	    y).

%character('Aline',          n, y, n, n, n, n, n, n).
%character('Patricia',          n, n, y, n, y, y, n, y).
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
  findall(X, character(X, SexoQuery), L),
  length(L, N), N == 1,
  character(Z, SexoQuery),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round.


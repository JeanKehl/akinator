:- style_check(-singleton).
:- dynamic characteristic/2.
:- dynamic character/8.
:- dynamic clearBase/1.
:- dynamic clearBase1/1.
:- dynamic play/0.
:- dynamic play/1.
:- dynamic question_sexo/0.
:- dynamic question_mora/0.
:- dynamic question_miojo/0.
:- dynamic question_idade/0.
:- dynamic question_smo/0.
:- dynamic question_curso/0.
:- dynamic question_barba/0.
:- dynamic question_sysmo/0.

%symbolic fact
characteristic(nothing, y_n).

clearBase(X):- clearBase1(X), fail.
  clearBase(X).

clearBase1(X):- retract(X).
  clearBase1(X).

% Main cast
% Name, Sexo, mora, Miojo, Idade, Smo, Curso, Barba, Sysmo
% Respostas: Y(Sim) N(Não)

character('Aline',          n, y, n, n, n, n, n, n).
character('Patricia',          n, n, y, n, y, y, n, y).
character('Jordan',         y, y, n, y, y, y, n, n).
character('Pedro',      y, n, y, y, n, n, n, n).
character('Jean',          y, y, y, y, y, n, n, n).
character('Anderson',          y, n, n, y, y, y, n, n).
character('Alexandre',  y, y, n, y, y, y, y, n).
character('Dionatta',          y, y, n, y, n, y, y, n).
character('Felipe Finger',            y, n, n, n, n, y, y, n).
character('Felipe Amado',          y, y, y, n, y, n, n, n).
character('Henrique',            y, n, n, n, y, n, y, n).
character('Jackson',           y, y, n, n, n, y, y, n).
character('Joao Paulo',        y, y, n, n, y, y, y, y).
character('Junior',            y, y, n, n, y, y, n, y).
character('João vitor',           y, y, y, n, n, n, y, n).
character('Jonathan',          y, y, y, n, n, n, n, n).
character('Leonardo',           y, n, y, n, y, y, y, y).
character('Luis Justino',      y, n, y, n, y, y, n, y).
character('Luiz Seco',         y, y, y, n, n, y, y, n).
character('Tiago',           y, y, y, n, n, y, y, y).
character('Gabriel',           y, y, y, n, n, y, y, y).
character('Natan',           y, y, y, n, n, y, y, y).




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
  findall(X, character(X, SexoQuery, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, _, _, _, _, _, _, _),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_mora.

question_mora :-
  cls, print_splash, write('\t Mora em São Miguel do Oeste  (y/n)? '),
  read(Answermora),
  asserta(characteristic(mora, Answermora)),
  characteristic(sexo, SexoQuery),
  characteristic(mora, moraQuery),
  findall(X, character(X, SexoQuery, moraQuery, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, moraQuery, _, _, _, _, _, _),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_miojo.

question_miojo :-
  cls, print_splash, write('\tVoce gosta de miojo (y/n)? '),
  read(AnswerMiojo),
  asserta(characteristic(miojo, AnswerMiojo)),
  characteristic(sexo, SexoQuery),
  characteristic(cor, CorQuery),
  characteristic(miojo, MiojoQuery),
  findall(X, character(X, SexoQuery, CorQuery, MiojoQuery, _, _, _, _, _), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, CorQuery, MiojoQuery, _, _, _, _, _),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_idade.

question_idade :-
  cls, print_splash, write('\tVoce tem mais de 22 anos de idade (y/n)? '),
  read(AnswerIdade),
  asserta(characteristic(idade, AnswerIdade)),
  characteristic(sexo, SexoQuery),
  characteristic(cor, CorQuery),
  characteristic(miojo, MiojoQuery),
  characteristic(idadee, IdadeQuery),
  findall(X, character(X, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, _, _, _, _), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, _, _, _, _),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_smo.

question_smo :-
  cls, print_splash, write('\tVoce mora em Sao Miguel do Oeste (y/n)? '),
  read(AnswerSmo),
  asserta(characteristic(smo, AnswerSmo)),
  characteristic(sexo, SexoQuery),
  characteristic(cor, CorQuery),
  characteristic(miojo, MiojoQuery),
  characteristic(idade, IdadeQuery),
  characteristic(smo, SmoQuery),
  findall(X, character(X, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, SmoQuery, _, _, _), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, SmoQuery, _, _, _),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_curso.


question_curso :-
  cls, print_splash, write('\tA area de trabalho que voce atua e relacionada ao curso (y/n)? '),
  read(AnswerCurso),
  asserta(characteristic(curso, AnswerCurso)),
  characteristic(sexo, SexoQuery),
  characteristic(cor, CorQuery),
  characteristic(miojo, MiojoQuery),
  characteristic(idade, IdadeQuery),
  characteristic(smo, SmoQuery),
  characteristic(curso, CursoQuery),
  findall(X, character(X, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, SmoQuery, CursoQuery, _, _), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, SmoQuery, CursoQuery, _, _),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_barba.

question_barba :-
  cls, print_splash, write('\tVoce possui barba (y/n)? '),
  read(AnswerBarba),
  asserta(characteristic(barba, AnswerBarba)),
  characteristic(sexo, SexoQuery),
  characteristic(cor, CorQuery),
  characteristic(miojo, MiojoQuery),
  characteristic(idade, IdadeQuery),
  characteristic(smo, SmoQuery),
  characteristic(curso, CursoQuery),
  characteristic(barba, BarbaQuery),
  findall(X, character(X, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, SmoQuery, CursoQuery, BarbaQuery, _), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, SmoQuery, CursoQuery, BarbaQuery, _),
  (Z == 'Uesley' -> cls, splash_darth_vader;
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round);
  question_sysmo.

question_sysmo :-
  cls, print_splash, write('\tVoce trabalha na Sysmo Sistema (y/n)? '),
  read(AnswerSysmo),
  asserta(characteristic(sysmo, AnswerSysmo)),
  characteristic(sexo, SexoQuery),
  characteristic(cor, CorQuery),
  characteristic(miojo, MiojoQuery),
  characteristic(idade, IdadeQuery),
  characteristic(smo, SmoQuery),
  characteristic(curso, CursoQuery),
  characteristic(barba, BarbaQuery),
  characteristic(sysmo, SysmoQuery),
  findall(X, character(X, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, SmoQuery, CursoQuery, BarbaQuery, SysmoQuery), L),
  length(L, N), N == 1,
  character(Z, SexoQuery, CorQuery, MiojoQuery, IdadeQuery, SmoQuery, CursoQuery, BarbaQuery, SysmoQuery),
  cls, print_splash, write('\tHmm... Eu acho que... '), write(Z), write('!'), new_round;
  cls, print_splash, write('\tArghhh!!! Nao!!!'), new_round.

splash_darth_vader :-
  write("
\t                       .-.
\t                      |_:_|
\t                     /(_Y_)\\
\t.                   ( \\/M\\/ )
\t '.               _.'-/'-'\\-'._
\t   ':           _/.--'[[[[]'--.\\_
\t     ':        /_'  : |::\"| :  '.\\
\t       ':     //   ./ |oUU| \\.'  :\\
\t         ':  _:'..' \\_|___|_/ :   :|
\t           ':.  .'  |_[___]_|  :.':\\
\t            [::\\ |  :  | |  :   ; : \\
\t             '-'   \\/'.| |.' \\  .;.' |
\t             |\\_    \\  '-'   :       |
\t             |  \\    \\ .:    :   |   |
\t             |   \\    | '.   :    \\  |
\t             /       \\   :. .;       |
\t            /     |   |  :__/     :  \\\\
\t           |  |   |    \\:   | \\   |   ||
\t          /    \\  : :  |:   /  |__|   /|
\t          |     : : :_/_|  /'._\\  '--|_\\
\t          /___.-/_|-'   \\  \\
\t                         '-'"),
  write("\n\tI WANT YOU...\n\tFOR THE DARK SIDE POWER").

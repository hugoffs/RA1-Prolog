% importação do base_conhecimento.pl
:- [base_conhecimento].

% declarar variável dinâmica para armazenar respostas
:- dynamic(materia_escolhida/1).

% consult("regras.pl").

/* 
    ● Conduzir o questionário de forma interativa.
    ● Armazenar as respostas do usuário dinamicamente (usando assertz/1)
*/
% percorre lista de perguntas recursivamente
perguntar_lista([]).  % caso base: lista vazia 

perguntar_lista([pergunta(_, Texto, Materia)|Resto]) :-
    format('~w (sim/nao): ', [Texto]),
    read_line_to_string(user_input, Resposta),
    (Resposta = "sim" -> assertz(materia_escolhida(Materia)); true),
    perguntar_lista(Resto). 

% ----------------- A FAZER ------------------
/*
    ● Exibir os resultados de forma organizada
*/

% calcular pontuação de compatibilidade para cada trilha

% calcular pontuação por curso
pontuacao_por_curso(Curso, Pontuacao) :-
    findall(X,
        ( perfil(Curso, Materia, X),
          materia_escolhida(Materia)   % só verifica se a matéria foi escolhida
        ),
        ListaValores),
    sum_list(ListaValores, Pontuacao).

% gerar lista de pontuações de todos os cursos
pontuacoes_cursos(ListaCursoPontuacao) :-
    findall((Curso, Pontuacao),
        ( trilha(Curso, _Descricao),
          pontuacao_por_curso(Curso, Pontuacao)
        ),
        ListaCursoPontuacao).

% exibir resultado
mostrar_resultados :-
    pontuacoes_cursos(Lista),
    format('Pontuações por curso:~n'),
    forall(member((Curso, Pontuacao), Lista),
           format('- ~w: ~w~n', [Curso, Pontuacao])).

% Exibir melhor resultado
% Exibir melhor resultado com justificativa
mostrar_curso_recomendado :-
    pontuacoes_cursos(Lista),
    findall(Pontuacao, member((_C, Pontuacao), Lista), Pontuacoes),
    max_list(Pontuacoes, MaxPontuacao),
    format('\nCurso(s) mais recomendado(s) (pontuação ~w):~n', [MaxPontuacao]),
    forall(
        member((Curso, MaxPontuacao), Lista),
        ( format('- ~w~n', [Curso]),
          justificar(Curso)
        )
    ).


% Recomendacao Justificada
justificar(Curso) :-
    format('Motivos para recomendar o curso ~w:~n', [Curso]),
    forall(materia_escolhida(Materia),
           ( perfil(Curso, Materia, Relevancia),
             Relevancia > 0,
             format('- Afinidade com ~w (relevância: ~w)~n', [Materia, Relevancia])
           )).

% iniciar questionário
inicio :-
    perguntas(Lista),
    retractall(materia_escolhida(_)),
    perguntar_lista(Lista),
    mostrar_materias,
    mostrar_curso_recomendado.

% mostrar respostas armazenadas
mostrar_materias :-
    format('Matérias escolhidas:~n'),
    forall(materia_escolhida(Materia),
           format('- ~w~n', [Materia])).

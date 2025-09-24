% importação do base_conhecimento.pl
:- [base_conhecimento].

% declarar variável dinâmica para armazenar respostas
:- dynamic(materia_escolhida/1).

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
    ● Calcular uma pontuação de compatibilidade para cada trilha com base nas respostas.
    ● Determinar a(s) trilha(s) mais recomendada(s).
    ● Exibir os resultados de forma organizada
*/

% calcular pontuação de compatibilidade para cada trilha

% -------------------- TESTE --------------------

% iniciar questionário
inicio :-
    perguntas(Lista),
    retractall(materia_escolhida(_)),  % limpa respostas anteriores
    perguntar_lista(Lista),
    
    % calcular pontuação para cada trilha
    calculo_pontuacao(TrilhasPontuacao),

    format('Matérias escolhidas:~n'),
    mostrar_materias.

% mostrar respostas armazenadas
mostrar_materias :-
    materia_escolhida(Materia),
    format('- ~w~n', [Materia]),
    fail.
mostrar_materias.  % para parar o backtracking

# RA1-Prolog — Sistema de Recomendação de Trilhas (SWI‑Prolog)

Projeto acadêmico em Prolog que conduz um questionário interativo e recomenda uma ou mais trilhas de estudo com base nas respostas do usuário. As regras de recomendação consideram a relevância de diferentes matérias para cada trilha e apresentam justificativas.

Este repositório utiliza SWI‑Prolog e não possui gerenciador de pacotes, build system ou scripts de automação. A execução é via console interativo do SWI‑Prolog.

## Sumário
- Visão geral
- Requisitos
- Como executar (interativo)
- Como executar testes (sem entrada manual)
- Estrutura do projeto
- Pontos de entrada (predicados)
- Scripts/Automação
- Dicas de uso
- Limitações e TODOs

## Visão geral
- Base de conhecimento: trilhas, perfis (relevância por matéria) e perguntas estão em `src/base_conhecimento.pl`.
- Regras: condução do questionário, armazenamento dinâmico das respostas, cálculo das pontuações e recomendação com justificativas estão em `src/regras.pl`.
- Testes: arquivos em `tests/` definem respostas pré‑preenchidas (`resposta/2`) para simular perfis e executar o fluxo sem digitar no console.

## Requisitos
- SWI‑Prolog (recomendado: versão atual estável)
  - macOS (Homebrew): `brew install swi-prolog`
  - Ubuntu/Debian: `sudo apt-get install swi-prolog`
  - Windows: baixar do site oficial: https://www.swi-prolog.org/

Não há dependências externas além do SWI‑Prolog.

## Como executar (interativo)
1. Abra o terminal e entre na raiz do projeto (diretório que contém `src/` e `tests/`).
2. Inicie o SWI‑Prolog:
   - `swipl`
3. Carregue os módulos:
   - `?- consult('src/base_conhecimento.pl').`
   - `?- consult('src/regras.pl').`
4. Inicie o questionário:
   - `?- iniciar.`
5. Responda cada pergunta digitando apenas `s` ou `n` e pressionando Enter.
6. Ao final, o sistema exibirá:
   - Matérias marcadas (suas respostas positivas)
   - Curso(s) recomendado(s) com a maior pontuação
   - Justificativas baseadas na relevância das matérias

Observação: a leitura aceita somente `s` ou `n`. Qualquer outro input repetirá a pergunta.

## Como executar testes (sem entrada manual)
Os testes carregam fatos `resposta(ID, s|n)` e executam o fluxo automaticamente.

Exemplo com `tests/perfil_teste_1.pl`:
1. `swipl`
2. `?- consult('src/base_conhecimento.pl').`
3. `?- consult('src/regras.pl').`
4. `?- consult('tests/perfil_teste_1.pl').`
5. `?- executar_teste.`

Arquivos de teste disponíveis:
- `tests/perfil_teste_1.pl` — Perfil com forte inclinação para lógica e dados.
- `tests/perfil_teste_2.pl`
- `tests/perfil_teste_3.pl`

Dica: você pode abrir e editar/duplicar um arquivo de teste para criar novos perfis.

## Estrutura do projeto
- `src/base_conhecimento.pl`
  - Define trilhas (`trilha/2`), perfis por curso e matéria (`perfil/3`), e perguntas (`perguntas/1`).
  - Contém comentários com exemplos de consultas para explorar a base.
- `src/regras.pl`
  - Importa a base de conhecimento.
  - Mantém respostas dinâmicas via `materia_escolhida/1`.
  - Conduz o questionário (`iniciar/0`), leitura estrita de `s`/`n` (`ler_sn/1`), e acumula escolhas (`perguntar_lista/1`).
  - Calcula pontuações (`pontuacao_por_curso/2`, `pontuacoes_cursos/1`).
  - Exibe resultados (`mostrar_materias/0`, `mostrar_resultados/0`, `mostrar_curso_recomendado/0`, `justificar/1`).
  - Suporta execução automatizada com respostas carregadas (`aplicar_respostas/0`, `executar_teste/0`).
- `tests/perfil_teste_*.pl`
  - Definem fatos `resposta/2` para simular perfis de respostas e rodar `executar_teste/0`.
- `README.md`
  - Este arquivo.

## Pontos de entrada (predicados)
- `iniciar/0`
  - Executa o fluxo completo interativo: pergunta, coleta respostas, exibe matérias escolhidas e recomendações com justificativas.
- `executar_teste/0`
  - Executa o fluxo completo usando fatos `resposta/2` previamente consultados (útil para testes automáticos/sem input).

Predicados auxiliares relevantes:
- `mostrar_materias/0`, `mostrar_resultados/0`, `mostrar_curso_recomendado/0`, `justificar/1`.

## Scripts/Automação
- Não há scripts de automação (shell, Makefile, npm, etc.).
- Execução e testes são feitos diretamente no REPL do SWI‑Prolog com `consult/1` e os predicados de alto nível.

## Dicas de uso
- Garantir que o diretório de trabalho do SWI‑Prolog seja a raiz do projeto para que os caminhos relativos funcionem.
- Para reexecutar o questionário/teste em uma mesma sessão, as respostas são limpas automaticamente por `iniciar/0` e `executar_teste/0` via `retractall/1`.
- Para inspecionar dados:
  - `?- findall((Nome,Descricao), trilha(Nome,Descricao), L).`
  - `?- findall((Curso,Materia,Relevancia), perfil(Curso,Materia,Relevancia), L).`
  - `?- perguntas(L).`

## Limitações e TODOs
- TODO: Empacotamento/automação opcional (ex.: script que carrega arquivos e chama `iniciar/0` automaticamente).
- TODO: Documentar `perfil_teste_2.pl` e `perfil_teste_3.pl` com descrições dos perfis.
- TODO: Adicionar instruções de contribuição e licença, caso aplicável.
- Observação: Não há testes automatizados no estilo unitário; os arquivos em `tests/` são cenários manuais/reprodutíveis.

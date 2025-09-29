# RA1-Prolog — Sistema de Recomendação de Trilhas (SWI‑Prolog)

Acadêmicos responsáveis:
Angelo Neto
Eduardo Mendes Carbonera
Hugo Fagundes
Kaio Teles

Projeto acadêmico em Prolog orientado a disciplina de Programação Lógica e Funcional que conduz um questionário interativo e recomenda uma ou mais trilhas de estudo com base nas respostas do usuário. As regras de recomendação consideram a relevância de diferentes matérias para cada trilha e apresentam justificativas.

Este repositório utiliza SWI‑Prolog e não possui gerenciador de pacotes, build system ou scripts de automação. A execução é via console interativo do SWI‑Prolog.

## Visão geral
- Base de conhecimento: trilhas, perfis (relevância por matéria) e perguntas estão em `src/base_conhecimento.pl`.
- Regras: condução do questionário, armazenamento dinâmico das respostas, cálculo das pontuações e recomendação com justificativas estão em `src/regras.pl`.
- Testes: arquivos em `tests/` definem respostas pré‑preenchidas (`resposta/2`) para simular perfis e executar o fluxo sem digitar no console.

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

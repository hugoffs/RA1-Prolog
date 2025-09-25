/*
como execultar o programa: 
swipl
consult("base_conhecimento.pl").
realizar a consulta
*/


% trilha(Nome, Descricao).
trilha(ciencia_de_dados,
    'Analise e interpretacao de grandes volumes de dados para extrair conhecimento.').

trilha(inteligencia_artificial,
    'Desenvolvimento de sistemas que simulam a inteligencia humana, como aprendizado de maquina e redes neurais.').

trilha(desenvolvimento_web,
    'Criacao e manutencao de sites e aplicacoes web, incluindo front-end e back-end.').

trilha(seguranca_da_informacao,
    'Protecao de sistemas e dados contra acessos nao autorizados e ataques ciberneticos.').

trilha(redes_e_infraestrutura,
    'Gerenciamento de redes de computadores e infraestrutura de TI para garantir conectividade e desempenho.').

% perfil(nome, Materia, relevancia)

% fazer 5 perfil para cada tilha 
% perfil(Curso, Materia, Relevancia)
perfil(ciencia_de_dados, matematica_estatistica, 5).
perfil(ciencia_de_dados, logica_programacao, 4).
perfil(ciencia_de_dados, design_visual, 1).
perfil(ciencia_de_dados, redes_computadores, 2).
perfil(ciencia_de_dados, sistemas_operacionais, 2).

perfil(desenvolvimento_web, design_visual, 3).
perfil(desenvolvimento_web, logica_programacao, 4).
perfil(desenvolvimento_web, sistemas_operacionais, 2).
perfil(desenvolvimento_web, redes_computadores, 2).
perfil(desenvolvimento_web, matematica_estatistica, 1).

perfil(inteligencia_artificial, logica_programacao, 4).
perfil(inteligencia_artificial, matematica_estatistica, 5).
perfil(inteligencia_artificial, sistemas_operacionais, 2).
perfil(inteligencia_artificial, redes_computadores, 2).
perfil(inteligencia_artificial, design_visual, 1).

perfil(seguranca_da_informacao, sistemas_operacionais, 5).
perfil(seguranca_da_informacao, redes_computadores, 4).
perfil(seguranca_da_informacao, logica_programacao, 3).
perfil(seguranca_da_informacao, matematica_estatistica, 2).
perfil(seguranca_da_informacao, design_visual, 1).

perfil(redes_e_infraestrutura, redes_computadores, 4).
perfil(redes_e_infraestrutura, sistemas_operacionais, 3).
perfil(redes_e_infraestrutura, logica_programacao, 2).
perfil(redes_e_infraestrutura, matematica_estatistica, 1).
perfil(redes_e_infraestrutura, design_visual, 1).


% pergunta(ID, Texto, Materia), sendo pergunta uma lista de perguntas
perguntas([
    pergunta(1, 'Você tem afinidade com matemática e estatística?', matematica_estatistica),
    pergunta(2, 'Você gosta de criar interfaces e experiências visuais?', design_visual),
    pergunta(3, 'Você se interessa por lógica de programação e algoritmos?', logica_programacao),
    pergunta(4, 'Você tem conhecimento em redes de computadores e segurança?', redes_computadores),
    pergunta(5, 'Você entende de sistemas operacionais e infraestrutura de TI?', sistemas_operacionais)
]).



% teste realizado para aparecer todos os perfil: ?-findall((Nome,Descricao), trilha(Nome,Descricao), Lista)
% perfil(ID, Texto, L).
% teste realizado para aparecer todos os perfil: ?-findall((Nome,Materia,Relevancia), perfil(Nome,Materia,Relevancia), Lista)
% pergunta(ID, Texto, Materia).
% teste realizado para aparecer todas as perguntas: ?-findall((ID,Texto,Materia), pergunta(ID,Texto,Materia), Lista).

-- Query: notas.sql
-- Descrição: Consulta as maiores notas obtidas pelo aluno por atividade.

SELECT 
    c.fullname AS curso_nome,
    ca.name AS curso_categoria,
    q.name AS avaliacao_nome,
    q.sumgrades AS avaliacao_valor,
    MAX(qa.sumgrades) AS avaliacao_maior_nota,
    ((MAX(qa.sumgrades) / q.sumgrades) * 100) AS avaliacao_porcentagem,
    (FROM_UNIXTIME(qa.timemodified, '%d/%m/%Y')) AS avaliacao_data
FROM
    mdl_course c
        INNER JOIN
    mdl_course_categories ca ON (c.category = ca.id)
        INNER JOIN
    mdl_quiz q ON (c.id = q.course)
        INNER JOIN
    mdl_quiz_attempts qa ON (q.id = qa.quiz)
        INNER JOIN
    mdl_user u ON (qa.userid = u.id)
WHERE
    qa.state = 'finished'
        AND u.username = '' -- inserir aqui o usuario (cpf/cnpj)
GROUP BY curso_nome , curso_categoria , avaliacao_nome , avaliacao_valor , avaliacao_data
ORDER BY curso_nome , curso_categoria;
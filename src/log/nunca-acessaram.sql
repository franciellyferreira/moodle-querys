-- Query: usuarios-nunca-acessaram.sql
-- Descrição: Consulta todos os usuários que nunca acessaram.

SELECT 
    CONCAT(u.firstname, ' ', u.lastname) AS usuario_nome,
    u.username AS usuario_identificacao
FROM
    mdl_user u
WHERE
    u.currentlogin = 0 AND u.lastlogin = 0
        AND u.lastaccess = 0
        AND u.deleted = 0
ORDER BY u.firstname , u.lastname
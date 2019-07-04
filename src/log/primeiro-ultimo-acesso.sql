-- Query: primeiro-ultimo-acesso.sql
-- Descrição: Consulta a data do primeiro e do último acesso.

SELECT 
    (FROM_UNIXTIME(firstaccess, '%d/%m/%Y %H:%i:%s')) AS acesso_primeiro,
    (FROM_UNIXTIME(lastaccess, '%d/%m/%Y %H:%i:%s')) AS acesso_ultimo,
    lastip AS acesso_ultimo_ip
FROM
    mdl_user
WHERE
    username = '' -- inserir aqui o usuario
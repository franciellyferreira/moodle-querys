## Query: certificado-por-codigo.sql
## Descrição: Consulta o certificado emitido pelo código gerado.

SELECT 
    CONCAT(u.firstname, ' ', u.lastname) AS usuario_nome,
    u.username AS usuario_identificacao,
    co.fullname AS curso_nome,
    c.printhours AS curso_carga_horaria,
    (FROM_UNIXTIME(ci.timecreated, '%d/%m/%Y')) AS certificado_data,
    ci.code AS certificado_codigo
FROM
    mdl_certificate c
        INNER JOIN
    mdl_certificate_issues ci ON (c.id = ci.certificateid)
        INNER JOIN
    mdl_user u ON (ci.userid = u.id)
        INNER JOIN
    mdl_course co ON (c.course = co.id)
WHERE
    ci.code = '' -- inserir aqui o código do certificado
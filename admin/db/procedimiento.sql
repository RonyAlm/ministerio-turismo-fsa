DROP PROCEDURE IF EXISTS mostrarContactosFestivales;
CREATE PROCEDURE `mostrarContactosFestivales`()
SELECT c.descripcion_contacto, c.rela_festivales,
        c.rela_tipo_contacto_cont 
        FROM contacto c 
        INNER JOIN festivales f ON f.id_festivales = c.rela_festivales
        WHERE f.id_festivales LIKE  c.rela_festivales
        AND (c.rela_tipo_contacto_cont = 2 OR  c.rela_tipo_contacto_cont = 9) 
        ORDER BY c.rela_tipo_contacto_cont
        
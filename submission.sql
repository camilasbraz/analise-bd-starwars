-- 2019027423
-- A2
SELECT ... ;
-- A0
SELECT nome
FROM Personagens
WHERE planeta ="Tatooine";
-- A1
SELECT N.nome
FROM Naves N JOIN Fabricantes F ON N.fabricante=F.nome
WHERE F.planeta ="Naboo" AND N.custo_em_creditos < 500000;
-- A9
SELECT ... ;
-- A3
SELECT ... ;
-- B2
SELECT ... ;
-- B7
SELECT ... ;
-- B4
SELECT ... ;
-- B0
SELECT ... ;
-- B3
SELECT ... ;
-- 2019027423
-- A2
SELECT E.nome
FROM Especies E JOIN Planetas P ON E.planeta = P.nome
WHERE (E.classificacao = "reptiliano") AND (P.clima = "arido" OR P.clima = "umido");
-- A0
SELECT nome
FROM Personagens
WHERE planeta ="Tatooine";
-- A1
SELECT N.nome
FROM Naves N JOIN Fabricantes F ON N.fabricante=F.nome
WHERE F.planeta ="Naboo" AND N.custo_em_creditos < 500000;
-- A9
SELECT nome, sois, luas
FROM Planetas
WHERE sois > luas AND luas > 0;
-- A3
SELECT P.nome
FROM Planetas P JOIN Fabricantes F ON P.nome = F.planeta
WHERE produto = "ambos";
-- B2
SELECT f.nome, COUNT(DISTINCT n.nome) AS quantidade_naves, COUNT(DISTINCT v.nome) AS quantidade_veiculos
FROM Fabricantes f
JOIN Naves n ON f.nome = n.fabricante
JOIN veiculos v ON f.nome = v.fabricante
GROUP BY f.nome
HAVING COUNT(DISTINCT n.nome) > 0 AND COUNT(DISTINCT v.nome) > 0;
-- B7
SELECT f.nome, COUNT(DISTINCT n.nome) AS quantidade_naves, COUNT(DISTINCT v.nome) AS quantidade_veiculos
FROM Fabricantes f
JOIN Naves n ON f.nome = n.fabricante
JOIN Veiculos v ON f.nome = v.fabricante
GROUP BY f.nome
HAVING COUNT(DISTINCT n.nome) > COUNT(DISTINCT v.nome);
-- B4
SELECT P.nome, COUNT(C.nome) AS quantidade_personagens
FROM Planetas P
JOIN Personagens C ON P.nome = C.planeta
GROUP BY P.nome
ORDER BY quantidade_personagens DESC
LIMIT 1;
-- B3
SELECT p.nome, p.altura
FROM Personagens p
JOIN (
  SELECT especie, MAX(altura) AS altura_maxima
  FROM Personagens
  GROUP BY especie
) AS subquery ON p.especie = subquery.especie AND p.altura = subquery.altura_maxima
ORDER BY p.altura ASC;
-- B5
SELECT e.nome as nome_especie, e.tempo_de_vida_medio, p.nome as nome_planeta
FROM Especies e
JOIN planetas p ON e.planeta = p.nome
WHERE (e.tempo_de_vida_medio >= 90 AND p.gravidade > 1)
   OR (p.nome IN (
        SELECT f.planeta
        FROM Fabricantes f
        JOIN Naves n ON f.nome = n.fabricante
        WHERE n.custo_em_creditos >= 1000000
      ));
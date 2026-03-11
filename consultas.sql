-- Livros mais emprestados

SELECT 
	l.titulo,
	COUNT(e.id_emprestimo) AS total_emprestimos
FROM emprestimos e
JOIN livros l 
	ON e.id_livro = l.id_livro
GROUP BY
	l.titulo
ORDER BY 
	total_emprestimos DESC;

-- Gêneros mais populares

SELECT 
	l.genero,
	COUNT(e.id_emprestimo) AS total_emprestimos
FROM emprestimos e
JOIN livros l 
	ON e.id_livro = l.id_livro
GROUP BY
	l.genero
ORDER BY 
	total_emprestimos DESC
LIMIT
	5;

-- Autores mais lidos

SELECT
	l.autor,
	COUNT(e.id_emprestimo) AS total_emprestimos
FROM emprestimos e
JOIN livros l 
	ON e.id_livro = l.id_livro 
GROUP BY 
	l.autor 
ORDER BY
	total_emprestimos DESC;

-- Leitores mais ativos

SELECT 
	le.id_leitor,
	le.nome,
	COUNT(e.id_emprestimo) AS total_emprestimos
FROM leitores le
JOIN emprestimos e 
	ON le.id_leitor = e.id_leitor 
GROUP BY
	le.id_leitor, le.nome
ORDER BY 
	total_emprestimos DESC;
	
-- Idade dos leitores

SELECT
CASE
	WHEN idade BETWEEN 15 AND 19 THEN '15-19'
	WHEN idade BETWEEN 20 AND 24 THEN '20-24'
	WHEN idade BETWEEN 25 AND 29 THEN '25-29'
	WHEN idade BETWEEN 30 AND 34 THEN '30-34'
	WHEN idade BETWEEN 35 AND 39 THEN '35-39'
END AS faixa_idade,
COUNT(*) AS total
FROM leitores
GROUP BY 
	faixa_idade
ORDER BY
	faixa_idade;

-- Empréstimos mensais

SELECT 
	TO_CHAR(DATE_TRUNC('month', data_emprestimo), 'Mon YYYY') AS data,
	COUNT(id_emprestimo) AS total_emprestimos
FROM emprestimos
GROUP BY DATE_TRUNC('month', data_emprestimo)
ORDER BY DATE_TRUNC('month', data_emprestimo);

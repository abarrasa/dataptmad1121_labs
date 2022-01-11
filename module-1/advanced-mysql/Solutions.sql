--------------LAB MySQL Select--------------


/*SELECT aut.[au_id] as [AUTHOR ID], aut.[au_lname] as [LAST NAME],aut.[au_fname] as [FIRST NAME], tit2.[title] as [TITLE], pub.[pub_name] as [PUBLISHER]
FROM [dbo].[authors] as aut
INNER JOIN [dbo].[titleauthor] as tit1 ON aut.[au_id] = tit1.[au_id]
INNER JOIN [dbo].[titles] as tit2 ON tit1.[title_id] = tit2.[title_id]
INNER JOIN [dbo].[publishers] as pub ON tit2.[pub_id] = pub.[pub_id];

SELECT aut.[au_id] as [AUTHOR ID], aut.[au_lname] as [LAST NAME],aut.[au_fname] as [FIRST NAME], pub.[pub_name] as [PUBLISHER], COUNT(tit2.title_id) AS [TITLE COUNT]
FROM [dbo].[authors] as aut
    INNER JOIN [dbo].[titleauthor] as tit1 ON aut.[au_id] = tit1.[au_id]
    INNER JOIN [dbo].[titles] as tit2 ON tit1.[title_id] = tit2.[title_id]
    INNER JOIN [dbo].[publishers] as pub ON t2.[pub_id] = pub.[pub_id]
    GROUP BY aut.[au_id],aut.[au_lname],aut.[au_fname], pub.[pub_name];


SELECT TOP (3) aut.[au_id] as [AUTHOR ID], aut.[au_lname] as [LAST NAME],aut.[au_fname] as [FIRST NAME], COUNT(tit1.title_id) AS [TOTAL]
FROM [dbo].[authors] as aut
    LEFT JOIN [dbo].[titleauthor] as tit1 ON aut.[au_id] = tit1.[au_id]
    GROUP BY aut.[au_id],aut.[au_lname],aut.[au_fname]
    ORDER BY TOTAL DESC;


SELECT aut.[au_id] as [AUTHOR ID], aut.[au_lname] as [LAST NAME],aut.[au_fname] as [FIRST NAME], COUNT(tit1.title_id) AS [TOTAL]
FROM [dbo].[authors] as aut
    LEFT JOIN [dbo].[titleauthor] as tit1 ON aut.[au_id] = tit1.[au_id]
    GROUP BY aut.[au_id],aut.[au_lname],aut.[au_fname]
    ORDER BY TOTAL DESC;*/

------------LAB Advanced MySQL----------
---Challenge 1---
/*SELECT TA.title_id, TA.au_id, T.advance * TA.royaltyper / 100 as advance ,T.price * SA.qty * T.royalty / 100 * TA.royaltyper / 100 as royalty
    FROM dbo.titleauthor as TA, dbo.titles as T, dbo.sales as SA
    WHERE TA.title_id = T.title_id and T.title_id = SA.title_id;

SELECT TA.title_id ,TA.au_id, SUM(T.advance * TA.royaltyper / 100) as advance, SUM(T.price * SA.qty * T.royalty / 100 * TA.royaltyper / 100) as royalty
    INTO Tabla_1
    FROM dbo.titleauthor as TA, dbo.titles as T, dbo.sales as SA
    WHERE TA.title_id = T.title_id and T.title_id = SA.title_id
    GROUP BY TA.au_id, TA.title_id;

SELECT TOP (3) tb1.au_id as ID_Autor, SUM(tb1.advance + tb1.royalty) as profits
    FROM dbo.Tabla_1 as tb1
    GROUP BY tb1.au_id
    ORDER BY profits DESC;*/

---Challenge 2---

/*DROP TABLE step_1
SELECT TA.title_id, TA.au_id, T.advance * TA.royaltyper / 100 as advance, T.price * SA.qty * T.royalty / 100 * TA.royaltyper / 100 as royalty
        INTO step_1
    FROM dbo.titleauthor as TA, dbo.titles as T, dbo.sales as SA
    WHERE TA.title_id = T.title_id and T.title_id = SA.title_id;
--Paso 2
DROP TABLE step_2
    SELECT P1.title_id, P1.au_id, SUM(P1.advance) as advance, SUM(P1.Royalty) as royalty
        INTO step_2
    FROM dbo.step_1 as P1
    GROUP BY P1.title_id, P1.au_id;
--Paso 3
SELECT TOP (3) P2.au_id as ID_Autor, SUM(P2.advance + P2.royalty) as profits
    FROM dbo.step_2 as P2
    GROUP BY P2.au_id
    ORDER BY profits DESC;

---Challenge 3---
SELECT TOP (3) P2.au_id as ID_Autor, SUM(P2.advance + P2.royalty) as profits
        INTO most_profiting_authors
    FROM dbo.step_2 as P2
    GROUP BY P2.au_id
    ORDER BY profits DESC;*/







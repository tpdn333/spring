USE spr1;

SELECT * FROM tbl_board
ORDER BY bno DESC;

-- 제목 검색
SELECT * FROM tbl_board
WHERE title LIKE '%자바%'
ORDER BY bno DESC
LIMIT 0, 10;

-- 제목 or 본문
SELECT * FROM tbl_board
WHERE 
title LIKE '%자바%'
OR content LIKE '%123%'
ORDER BY bno DESC
LIMIT 0, 10;

-- 제목 or 본문 or 작성자
SELECT * FROM tbl_board
WHERE 
title LIKE '%자바%'
OR content LIKE '%123%'
OR writer LIKE '%123%'
ORDER BY bno DESC
LIMIT 0, 10;

SELECT * FROM(
	SELECT 
    rownum rn, bno title, content, writer, regdate, updatedate
    from tbl_board
    where(title like '%test%' or content like '%test%') and rownum <= 20
)
where rn > 10;

UPDATE tbl_board
SET views = views + 1
WHERE bno = 123;
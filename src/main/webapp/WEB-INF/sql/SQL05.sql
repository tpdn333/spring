use spr1;

SELECT b.*, count(r.rno)
FROM tbl_board b LEFT JOIN tbl_reply r ON b.bno = r.bno
GROUP BY b.bno
ORDER BY b.bno DESC
LIMIT 0, 10;
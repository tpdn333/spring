USE spr1;

SELECT * FROM tbl_member;
SELECT * FROM tbl_member_auth;


INSERT INTO tbl_reply
(bno, reply, replyer)
VALUES
(101, hi, test);

CREATE TABLE tbl_member(
	userid VARCHAR(50) PRIMARY KEY,
    userpw VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    regdate TIMESTAMP DEFAULT NOW(),
    updatedate TIMESTAMP DEFAULT NOW(),
    enabled TINYINT(1) DEFAULT 1
);

CREATE TABLE tbl_member_auth(
	id INT AUTO_INCREMENT PRIMARY KEY,
    userid VARCHAR(50) NOT NULL,
    auth VARCHAR(50) NOT NULL,
    FOREIGN KEY (userid) REFERENCES tbl_member(userid)
);

SELECT 
			m.userid userid,
			m.userpw userpw,
			m.username username,
			m.enabled enabled,
			m.regdate regdate,
			m.updateDate updateDate,
			a.auth auth
		FROM
			tbl_member m LEFT JOIN tbl_member_auth a ON m.userid = a.userid
		WHERE 
			m.userid = 'admin';

CREATE INDEX idx_reply ON tbl_reply (bno DESC, rno ASC);

SELECT rno, bno, reply, replyer, replydate, updatedate
FROM tbl_reply
WHERE bno = 102
	  AND rno > 0
ORDER BY rno ASC
LIMIT 0, 10;












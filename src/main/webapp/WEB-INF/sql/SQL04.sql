CREATE TABLE tbl_reply(
	rno INT PRIMARY KEY AUTO_INCREMENT,
	bno INT NOT NULL,
    reply VARCHAR(2000) NOT NULL,
    replyer VARCHAR(50) NOT NULL,
    replyDate TIMESTAMP DEFAULT NOW(),
    updatedate TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (bno) REFERENCES tbl_board(bno)
);

ALTER TABLE tbl_reply ADD CONSTRAINT pk_relpy PRIMARY KEY (rno); -- X
ALTER TABLE tbl_reply ADD CONSTRAINT fk_reply_board FOREIGN KEY (bno) REFERENCES tbl_board(bno);

SELECT * FROM tbl_board
ORDER BY bno DESC;

SELECT * FROM tbl_reply;

SELECT * FROM tbl_reply
		WHERE bno = 125
		ORDER BY rno ASC;
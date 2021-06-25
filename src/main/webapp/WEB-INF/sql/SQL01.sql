CREATE DATABASE spr1;
USE spr2;

CREATE TABLE tbl_board(
	bno INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    regdate TIMESTAMP DEFAULT NOW(),
    updatedate TIMESTAMP DEFAULT NOW()
);

INSERT INTO tbl_board (title, content, writer)
VALUES ('vu', 'test content java', 'user00');



SELECT * FROM tbl_board
ORDER BY bno DESC;

-- 연습
CREATE TABLE tbl_test1 (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL
);

INSERT INTO tbl_test1 (name, age) VALUES ('jimin', 22);
INSERT INTO tbl_test1 (name, age) VALUES ('suga', 33);
INSERT INTO tbl_test1 (name, age) VALUES ('dbfla', 66);

SELECT * FROM tbl_test1;

-- org.zerock.domain.Test1VO (bean)
-- org.zerock.mapper.Test1Mapper (interface)
-- org.zerock.mapper.Test1Mapper.xml (xml)
-- Test1Tests
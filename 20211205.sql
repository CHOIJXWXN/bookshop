CREATE DATABASE bookshop;

USE bookshop;

CREATE TABLE users (
	user_id 		VARCHAR(20) 	PRIMARY KEY,
    user_pw 		VARCHAR(20)		NOT NULL,
    user_name 		VARCHAR(20)		NOT NULL,
    user_birth 		VARCHAR(8),
    user_nickname 	VARCHAR(20),
    user_email 		VARCHAR(100) 	NOT NULL		UNIQUE,
    user_phone 		VARCHAR(11) 	NOT NULL		UNIQUE,
    user_addr 		TEXT			NOT NULL,
    user_point 		INT 			DEFAULT 0,
    user_admin 		INT 			DEFAULT 0,
    user_init_genre VARCHAR(20)		NOT NULL
);

CREATE TABLE book (
	book_id			INT 			PRIMARY KEY 	AUTO_INCREMENT,
    book_title		TEXT			NOT NULL,
    book_writer		TEXT			NOT NULL,
    book_pub		TEXT			NOT NULL,
    book_date		DATE			NOT NULL,
    book_price		INT				NOT NULL,
    book_genre		VARCHAR(20)		NOT NULL,
    book_sell_tot	INT				DEFAULT 0,
    book_cover      TEXT,           #무지 이미지 경로를 디폴트로
    book_detail     TEXT            #무지 이미지 경로를 디폴트로
);

CREATE TABLE cart (
	user_id 	VARCHAR(20),
    book_id 	INT,
    book_cnt 	INT				NOT NULL,
    checked 	INT 			DEFAULT 0,
    PRIMARY KEY (user_id, book_id)
);

CREATE TABLE orders (
	order_id	    INT 		PRIMARY KEY 	AUTO_INCREMENT,     # 형식상 PK
    order_num       TEXT        NOT NULL,                           # 실제 주문 번호
    user_id		    VARCHAR(20) NOT NULL,
    order_name      VARCHAR(20) NOT NULL,
    order_addr      TEXT        NOT NULL,
    order_phone     VARCHAR(11) NOT NULL,
    order_tot	    INT,
    ship_cost	    INT 		DEFAULT 3000,
    final_cost	    INT,
    comments	    TEXT,
    order_date	    DATE        NOT NULL,
    order_cancel    INT         DEFAULT 0
);

CREATE TABLE orderlist (
	order_id 	INT,
    book_id 	INT,
    book_cnt 	INT 	NOT NULL,
    PRIMARY KEY (order_id, book_id)
);

CREATE TABLE delivery (
	order_id 		INT		PRIMARY KEY,
    tracking_num 	INT
);

CREATE TABLE ask (
	ask_id			INT				PRIMARY KEY		AUTO_INCREMENT,
    writer			VARCHAR(20)		NOT NULL,
    ask_title		TEXT			NOT NULL,
    ask_contents	TEXT			NOT NULL,
    ask_date		DATE            NOT NULL,
    ask_sort		VARCHAR(20)
);

CREATE TABLE askreply (
	askreply_id			INT			PRIMARY KEY		AUTO_INCREMENT,
	ask_id				INT			NOT NULL,
    writer				VARCHAR(20)	NOT NULL,
    askreply_contents	TEXT		NOT NULL,
    askreply_date 		DATE        NOT NULL
);

CREATE TABLE review (
    user_id             VARCHAR(20),
    book_id             INT,    
    review_score        INT         NOT NULL,
    review_contents     TEXT        NOT NULL,
    review_date         DATE        NOT NULL,
    PRIMARY KEY (user_id, book_id)
);

CREATE TABLE record (
    user_id             VARCHAR(20),
    book_id             INT,
    record_init_date    DATE            DEFAULT '2000-01-01',
    record_fin_date     DATE            DEFAULT '2999-12-31',
    record_score        INT             NOT NULL,
    record_contents     TEXT            NOT NULL,
    record_date         DATE            NOT NULL,
    PRIMARY KEY (user_id, book_id)
)

# 총 주문 금액 반환 함수 (필요X 제이쿼리로 처리)
DELIMITER $$
CREATE FUNCTION `get_order_tot` (				 #함수명 : get_order_tot
	order_id INT								 #파라미터명 (주문번호를 받아서 해당 주문의 총가격 계산할 것)
)
RETURNS INT										 #반환타입
BEGIN
	DECLARE order_tot INT;						 #변수명과 타입 지정
    SELECT SUM(A.book_cnt * B.book_price)		 #수량*가격
    INTO order_tot								 #order_tot 변수에 저장
    FROM orderlist A, book B					 #수량은 주문목록테이블 에서, 가격은 책 테이블에서
    WHERE A.book_id = B.book_id;				 #조인
RETURN order_tot;								 #order_tot 값 반환
END $$
DELIMITER ;

# 주문 번호 반환 함수 (20211205-000000 형식)
DELIMITER $$
CREATE FUNCTION `get_order_num` ()
RETURNS TEXT
BEGIN
    DECLARE order_num TEXT;
    SELECT CONCAT(DATE_FORMAT(NOW(), '%Y%m%d'), '-', (SELECT LPAD(COUNT(*), 6, '0') FROM orders WHERE DATE_FORMAT(order_date, '%Y%m%d') = DATE_FORMAT(NOW(), '%Y%m%d')))
    INTO order_num;
    RETURN order_num;
END $$
DELIMITER ;
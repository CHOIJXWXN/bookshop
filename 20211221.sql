CREATE DATABASE bookshop;

USE bookshop;
DROP TABLE book;
SELECT * FROM book;

#회원 테이블 생성
CREATE TABLE users (
	user_id 		VARCHAR(20) 	PRIMARY KEY,
    user_pw 		TEXT			NOT NULL,
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

# 상품 테이블 생성
CREATE TABLE book (
	book_id			VARCHAR(20) 	PRIMARY KEY,
    book_title		TEXT			NOT NULL,
    book_writer		TEXT			NOT NULL,
    book_pub		TEXT			NOT NULL,
    book_date		DATE			NOT NULL,
    book_price		INT				NOT NULL,
    book_genre		VARCHAR(20)		NOT NULL,
    book_sell_tot	INT				DEFAULT 0,
    book_cover      VARCHAR(20)     DEFAULT '0.jpg',
    book_intro 	    TEXT,
    book_contents	TEXT,
    available		INT 			DEFAULT 0 			# 0:존재 1:삭제
);

# 장바구니 테이블 생성
CREATE TABLE cart (
	user_id 	VARCHAR(20),
    book_id 	INT,
    book_cnt 	INT				NOT NULL,
    PRIMARY KEY (user_id, book_id)
);

# 주문 테이블 생성
CREATE TABLE orders (
    order_num       VARCHAR(15) PRIMARY KEY,
    user_id		    VARCHAR(20) NOT NULL,
    order_name      VARCHAR(20) NOT NULL,
    order_addr      TEXT        NOT NULL,
    order_phone     VARCHAR(11) NOT NULL,
    order_tot	    INT,
    ship_cost	    INT 		DEFAULT 3000,
    final_cost	    INT,
    comments	    TEXT,
    order_date	    DATE        NOT NULL,
    order_status    VARCHAR(20) DEFAULT '배송준비중'		# 배송준비중 / 배송중 / 배송완료
);

# 주문 목록 테이블 생성
CREATE TABLE orderlist (
	order_num   VARCHAR(15),
    book_id 	VARCHAR(20),
    book_cnt 	INT 		NOT NULL,
    PRIMARY KEY (order_num, book_id)
);

# 배송 테이블 생성
CREATE TABLE delivery (
	order_num       VARCHAR(15)		PRIMARY KEY,
    tracking_num 	VARCHAR(20)
);

# 문의 테이블 생성
CREATE TABLE ask (
	ask_id			INT				PRIMARY KEY		AUTO_INCREMENT,
    writer			VARCHAR(20)		NOT NULL,
    ask_title		TEXT			NOT NULL,
    ask_contents	TEXT			NOT NULL,
    ask_date		DATE            NOT NULL,
    ask_sort		VARCHAR(20)
);

# 문의 댓글 테이블 생성
CREATE TABLE askreply (
	askreply_id			INT			PRIMARY KEY		AUTO_INCREMENT,
	ask_id				INT			NOT NULL,
    writer				VARCHAR(20)	NOT NULL,
    askreply_contents	TEXT		NOT NULL,
    askreply_date 		DATE        NOT NULL
);

# 리뷰 테이블 생성
CREATE TABLE review (
	review_id			INT			PRIMARY KEY		AUTO_INCREMENT,
    user_id             VARCHAR(20),
    book_id             VARCHAR(20),    
    review_score        INT         NOT NULL,
    review_contents     TEXT        NOT NULL,
    review_date         DATE        NOT NULL
);

# 기록 테이블 생성
CREATE TABLE record (
    user_id             VARCHAR(20),
    book_id             INT,
    record_init_date    DATE            DEFAULT '2000-01-01',
    record_fin_date     DATE            DEFAULT '2999-12-31',
    record_score        INT             NOT NULL,
    record_contents     TEXT            NOT NULL,
    record_date         DATE            NOT NULL,
    PRIMARY KEY (user_id, book_id)
);
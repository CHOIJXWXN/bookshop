CREATE DATABASE bookshop;

USE bookshop;

# 회원 테이블 생성
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
    user_init_genre VARCHAR(20)		NOT NULL,
    user_title		VARCHAR(20)
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
    book_id 	VARCHAR(20),
    book_cnt 	INT				NOT NULL,
    PRIMARY KEY (user_id, book_id)
);


# 주문 테이블 생성
CREATE TABLE orders (
    order_num       VARCHAR(15) PRIMARY KEY,	# 주문 번호
    user_id		    VARCHAR(20) NOT NULL,		# 주문자 아이디
    order_name      VARCHAR(20) NOT NULL,		# 배송받는 사람 이름
    order_addr      TEXT        NOT NULL,		# 배송받을 주소
    order_phone     VARCHAR(11) NOT NULL,		# 배송받는 사람 전화번호
    order_tot	    INT,						# 주문 총 갯수
    ship_cost	    INT 		DEFAULT 3000,	# 배송비
    final_cost	    INT,						# 최종 결제 금액
    comments	    TEXT,						# 배송 메세지
    order_date	    DATE        NOT NULL,		# 주문 날짜
    order_status    VARCHAR(20)   				# 주문 상태 -> 입금전 /  배송중 /  배송완료
);

# 주문 목록 테이블 생성
CREATE TABLE orderlist (
	order_num   VARCHAR(15),			# 주문 번호
    book_id 	VARCHAR(20),			# 주문 상품
    book_cnt 	INT 		NOT NULL,	# 주문 상품 갯수
    PRIMARY KEY (order_num, book_id)
);

# 배송 테이블 생성
CREATE TABLE delivery (
	order_num       VARCHAR(15)		PRIMARY KEY,
    tracking_num 	VARCHAR(20)
);

# 문의 테이블 생성
CREATE TABLE ask (
	ask_id			INT				PRIMARY KEY		AUTO_INCREMENT,	# 문의 번호
    book_id			VARCHAR(20)		NOT NULL,						# book table의 book_id
    writer			VARCHAR(20)		NOT NULL,						# 작성자 = user_id
    ask_contents	TEXT			NOT NULL,						# 문의 내용
    ask_date		DATE            NOT NULL,						# 문의 등록 날짜
    ask_sort		VARCHAR(20),									# 문의 유형 -> 상품문의 / 배송문의 / 기타문의
    ask_status		VARCHAR(20)		DEFAULT '답변미완료',				# 문의 상태 -> 답변완료 / 답변미완료
    available		INT				DEFAULT 0,
    askreply_count	INT 			DEFAULT 0
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
	record_id			INT      		PRIMARY KEY		AUTO_INCREMENT,
    user_id             VARCHAR(20),
    book_id             VARCHAR(20),
    record_init_date    DATE            DEFAULT '2000-01-01',
    record_fin_date     DATE            DEFAULT '2999-12-31',
    record_score        INT             NOT NULL,
    record_contents     TEXT            NOT NULL,
    record_date         DATE            NOT NULL
);



SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';

SELECT C.order_num, C.user_id, C.book_id, D.book_title, D.book_writer, D.book_price, C.book_cnt, C.order_status, ROW_NUMBER() OVER (PARTITION BY C.order_num) FROM
   (
   SELECT A.order_num, A.user_id, B.book_id, B.book_cnt, A.order_status
   FROM orderTemp A, orderlist B
   WHERE A.order_num = B.order_num
   ) C, book D WHERE C.book_id = D.book_id
ORDER BY C.order_num DESC
LIMIT 0, 30;

SELECT DISTINCT(order_num) FROM orderTemp;

SELECT * FROM book GROUP BY book_genre;
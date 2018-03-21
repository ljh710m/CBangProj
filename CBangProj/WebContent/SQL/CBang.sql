
/* Drop Tables */

DROP TABLE ARTICLE_COMMENT CASCADE CONSTRAINTS;
DROP TABLE ARTICLE CASCADE CONSTRAINTS;
DROP TABLE EVENT_COMMENT CASCADE CONSTRAINTS;
DROP TABLE EVENT CASCADE CONSTRAINTS;
DROP TABLE NOTICE_COMMENT CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE CBANG_ADMIN CASCADE CONSTRAINTS;
DROP TABLE ADMIN_PRIVILEGE CASCADE CONSTRAINTS;
DROP TABLE BUILDING_OPTION CASCADE CONSTRAINTS;
DROP TABLE BUILDING_OPTION_LIST CASCADE CONSTRAINTS;
DROP TABLE CONTACT_ROOM CASCADE CONSTRAINTS;
DROP TABLE FAVORITE_ROOM CASCADE CONSTRAINTS;
DROP TABLE DETAIL CASCADE CONSTRAINTS;
DROP TABLE FAULT CASCADE CONSTRAINTS;
DROP TABLE PHOTO CASCADE CONSTRAINTS;
DROP TABLE ROOM_HISTORY CASCADE CONSTRAINTS;
DROP TABLE ROOM_OPTION CASCADE CONSTRAINTS;
DROP TABLE TRADE_TYPE CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;
DROP TABLE CBANG_MEMBER CASCADE CONSTRAINTS;
DROP TABLE JOIN_PATH CASCADE CONSTRAINTS;
DROP TABLE LOCATIONS CASCADE CONSTRAINTS;
DROP TABLE REAL_ESTATE_OFFICE CASCADE CONSTRAINTS;
DROP TABLE ROOM_OPTION_LIST CASCADE CONSTRAINTS;
DROP TABLE ROOM_TYPES CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE admin_code_seq;
DROP SEQUENCE admin_privilege_code_seq;
DROP SEQUENCE board_no_seq;
DROP SEQUENCE building_option_list_code_seq;
DROP SEQUENCE comment_no_seq;
DROP SEQUENCE fault_no_seq;
DROP SEQUENCE join_path_code_seq;
DROP SEQUENCE locations_code_seq;
DROP SEQUENCE member_no_seq;
DROP SEQUENCE photo_id_seq;
DROP SEQUENCE room_no_seq;
DROP SEQUENCE room_option_list_code_seq;
DROP SEQUENCE room_types_code_seq;
DROP SEQUENCE trade_type_code_seq;




/* Create Sequences */

-- 관리자/코드
CREATE SEQUENCE admin_code_seq INCREMENT BY 1 START WITH 1;
-- 관리자권한/등급코드
CREATE SEQUENCE admin_privilege_code_seq INCREMENT BY 1 START WITH 1;
-- 게시판/번호(공통)
CREATE SEQUENCE board_no_seq INCREMENT BY 1 START WITH 1;
-- 건물옵션항목/건물옵션코드
CREATE SEQUENCE building_option_list_code_seq INCREMENT BY 1 START WITH 1;
-- 댓글/번호(공통)
CREATE SEQUENCE comment_no_seq INCREMENT BY 1 START WITH 1;
-- 허위매물/허위매물번호
CREATE SEQUENCE fault_no_seq INCREMENT BY 1 START WITH 1;
-- 회원가입경로/회원가입경로코드
CREATE SEQUENCE join_path_code_seq INCREMENT BY 1 START WITH 1;
-- 위치정보/위치코드
CREATE SEQUENCE locations_code_seq INCREMENT BY 1 START WITH 1;
-- 회원/회원번호
CREATE SEQUENCE member_no_seq INCREMENT BY 1 START WITH 1;
-- 사진/사진코드
CREATE SEQUENCE photo_id_seq INCREMENT BY 1 START WITH 1;
-- 매물/매물 번호
CREATE SEQUENCE room_no_seq INCREMENT BY 1 START WITH 1;
-- 옵션항목/옵션코드
CREATE SEQUENCE room_option_list_code_seq INCREMENT BY 1 START WITH 1;
-- 방종류/방 종류 코드
CREATE SEQUENCE room_types_code_seq INCREMENT BY 1 START WITH 1;
-- 거래형식/
-- 거래코드
CREATE SEQUENCE trade_type_code_seq INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE ADMIN_PRIVILEGE
(
	privilege_code number NOT NULL,
	privilege_info varchar2(50),
	PRIMARY KEY (privilege_code)
);


CREATE TABLE ARTICLE
(
	article_no number NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	regdate date DEFAULT SYSDATE NOT NULL,
	admin_code number NOT NULL,
	PRIMARY KEY (article_no)
);


CREATE TABLE ARTICLE_COMMENT
(
	art_comt_no number NOT NULL,
	member_no number NOT NULL,
	content varchar2(400) NOT NULL,
	report_date date DEFAULT SYSDATE NOT NULL,
	article_no number NOT NULL,
	PRIMARY KEY (art_comt_no)
);


CREATE TABLE BUILDING_OPTION
(
	room_no number NOT NULL,
	option_code number NOT NULL,
	PRIMARY KEY (room_no, option_code)
);


CREATE TABLE BUILDING_OPTION_LIST
(
	option_code number NOT NULL,
	name varchar2(20) NOT NULL,
	PRIMARY KEY (option_code)
);


CREATE TABLE CBANG_ADMIN
(
	admin_code number NOT NULL,
	id varchar2(20) NOT NULL UNIQUE,
	password varchar2(200) NOT NULL,
	name varchar2(20),
	email varchar2(80),
	privilege_code number NOT NULL,
	PRIMARY KEY (admin_code)
);


CREATE TABLE CBANG_MEMBER
(
	member_no number NOT NULL,
	name varchar2(20),
	email varchar2(80) NOT NULL UNIQUE,
	password varchar2(200) NOT NULL,
	phone varchar2(30) NOT NULL UNIQUE,
	profile_photo varchar2(100),
	join_date date DEFAULT SYSDATE NOT NULL,
	job varchar2(20),
	office_no number,
	path_code number NOT NULL,
	PRIMARY KEY (member_no)
);


CREATE TABLE CONTACT_ROOM
(
	member_no number NOT NULL,
	room_no number NOT NULL,
	contact_info varchar2(20) NOT NULL,
	PRIMARY KEY (member_no, room_no)
);


CREATE TABLE DETAIL
(
	room_no number NOT NULL,
	detail_addr varchar2(100),
	common_charge number,
	charge_list varchar2(100),
	heating varchar2(20) NOT NULL,
	elevator varchar2(4) NOT NULL,
	move_date varchar2(20) NOT NULL,
	total_floor number,
	total_area number,
	room_title varchar2(100) NOT NULL,
	room_desc varchar2(1000) NOT NULL,
	memo varchar2(600) NOT NULL,
	PRIMARY KEY (room_no)
);


CREATE TABLE EVENT
(
	event_no number NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	regdate date DEFAULT SYSDATE NOT NULL,
	admin_code number NOT NULL,
	PRIMARY KEY (event_no)
);


CREATE TABLE EVENT_COMMENT
(
	ev_compt_no number NOT NULL,
	member_no number NOT NULL,
	content varchar2(400),
	report_date date DEFAULT SYSDATE,
	event_no number NOT NULL,
	PRIMARY KEY (ev_compt_no)
);


CREATE TABLE FAULT
(
	fault_no number NOT NULL,
	type varchar2(40) NOT NULL,
	add_info varchar2(600),
	phone varchar2(20) NOT NULL,
	room_no number NOT NULL,
	PRIMARY KEY (fault_no)
);


CREATE TABLE FAVORITE_ROOM
(
	member_no number NOT NULL,
	room_no number NOT NULL,
	PRIMARY KEY (member_no, room_no)
);


CREATE TABLE JOIN_PATH
(
	path_code number NOT NULL,
	path_type varchar2(40) NOT NULL,
	PRIMARY KEY (path_code)
);


CREATE TABLE LOCATIONS
(
	location_code number NOT NULL,
	roadAddress varchar2(100) NOT NULL,
	jibunAddress varchar2(100),
	lat varchar2(25) NOT NULL,
	lng varchar2(25) NOT NULL,
	sido varchar2(25),
	sigungu varchar2(25),
	bname varchar2(25),
	bname1 varchar2(25),
	PRIMARY KEY (location_code)
);


CREATE TABLE NOTICE
(
	notice_no number NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	regdate date DEFAULT SYSDATE NOT NULL,
	admin_code number NOT NULL,
	PRIMARY KEY (notice_no)
);


CREATE TABLE NOTICE_COMMENT
(
	note_comt_no number NOT NULL,
	member_no number NOT NULL,
	content varchar2(400) NOT NULL,
	report_date date DEFAULT SYSDATE NOT NULL,
	notice_no number NOT NULL,
	PRIMARY KEY (note_comt_no)
);


CREATE TABLE PHOTO
(
	photo_id number NOT NULL,
	room_no number NOT NULL,
	photo_path varchar2(100) NOT NULL,
	name varchar2(20) NOT NULL,
	PRIMARY KEY (photo_id)
);


CREATE TABLE REAL_ESTATE_OFFICE
(
	office_no number NOT NULL,
	name varchar2(40) NOT NULL,
	permit_no varchar2(50) NOT NULL UNIQUE,
	address varchar2(100) NOT NULL,
	represent varchar2(20) NOT NULL,
	office_phone varchar2(20) NOT NULL,
	PRIMARY KEY (office_no)
);


CREATE TABLE ROOM
(
	room_no number NOT NULL,
	member_no number NOT NULL,
	floor number NOT NULL,
	area number NOT NULL,
	location_code number NOT NULL,
	rent_type varchar2(10) NOT NULL,
	trade_type varchar2(20) NOT NULL,
	rm_type_code number NOT NULL,
	deposit1 number,
	deposit2 number,
	month_price number,
	-- 거래중
	-- 완료
	-- 보류
	state varchar2(10),
	start_date date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (room_no)
);


CREATE TABLE ROOM_HISTORY
(
	room_no number NOT NULL,
	end_date date NOT NULL,
	PRIMARY KEY (room_no)
);


CREATE TABLE ROOM_OPTION
(
	room_no number NOT NULL,
	option_code number NOT NULL,
	PRIMARY KEY (room_no, option_code)
);


CREATE TABLE ROOM_OPTION_LIST
(
	option_code number NOT NULL,
	name varchar2(20) NOT NULL,
	PRIMARY KEY (option_code)
);


CREATE TABLE ROOM_TYPES
(
	rm_type_code number NOT NULL,
	room_type varchar2(20) NOT NULL,
	PRIMARY KEY (rm_type_code)
);


CREATE TABLE TRADE_TYPE
(
	trade_code number NOT NULL,
	deposit2 number,
	deposit1 number,
	month_price number,
	room_no number NOT NULL,
	PRIMARY KEY (trade_code)
);



/* Create Foreign Keys */

ALTER TABLE CBANG_ADMIN
	ADD FOREIGN KEY (privilege_code)
	REFERENCES ADMIN_PRIVILEGE (privilege_code)
;


ALTER TABLE ARTICLE_COMMENT
	ADD FOREIGN KEY (article_no)
	REFERENCES ARTICLE (article_no)
;


ALTER TABLE BUILDING_OPTION
	ADD FOREIGN KEY (option_code)
	REFERENCES BUILDING_OPTION_LIST (option_code)
;


ALTER TABLE ARTICLE
	ADD FOREIGN KEY (admin_code)
	REFERENCES CBANG_ADMIN (admin_code)
;


ALTER TABLE EVENT
	ADD FOREIGN KEY (admin_code)
	REFERENCES CBANG_ADMIN (admin_code)
;


ALTER TABLE NOTICE
	ADD FOREIGN KEY (admin_code)
	REFERENCES CBANG_ADMIN (admin_code)
;


ALTER TABLE ARTICLE_COMMENT
	ADD FOREIGN KEY (member_no)
	REFERENCES CBANG_MEMBER (member_no)
;


ALTER TABLE CONTACT_ROOM
	ADD FOREIGN KEY (member_no)
	REFERENCES CBANG_MEMBER (member_no)
;


ALTER TABLE EVENT_COMMENT
	ADD FOREIGN KEY (member_no)
	REFERENCES CBANG_MEMBER (member_no)
;


ALTER TABLE FAVORITE_ROOM
	ADD FOREIGN KEY (member_no)
	REFERENCES CBANG_MEMBER (member_no)
;


ALTER TABLE NOTICE_COMMENT
	ADD FOREIGN KEY (member_no)
	REFERENCES CBANG_MEMBER (member_no)
;


ALTER TABLE ROOM
	ADD FOREIGN KEY (member_no)
	REFERENCES CBANG_MEMBER (member_no)
;


ALTER TABLE EVENT_COMMENT
	ADD FOREIGN KEY (event_no)
	REFERENCES EVENT (event_no)
;


ALTER TABLE CBANG_MEMBER
	ADD FOREIGN KEY (path_code)
	REFERENCES JOIN_PATH (path_code)
;


ALTER TABLE ROOM
	ADD FOREIGN KEY (location_code)
	REFERENCES LOCATIONS (location_code)
;


ALTER TABLE NOTICE_COMMENT
	ADD FOREIGN KEY (notice_no)
	REFERENCES NOTICE (notice_no)
;


ALTER TABLE CBANG_MEMBER
	ADD FOREIGN KEY (office_no)
	REFERENCES REAL_ESTATE_OFFICE (office_no)
;


ALTER TABLE BUILDING_OPTION
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE CONTACT_ROOM
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE DETAIL
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE FAULT
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE FAVORITE_ROOM
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE PHOTO
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE ROOM_HISTORY
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE ROOM_OPTION
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE TRADE_TYPE
	ADD FOREIGN KEY (room_no)
	REFERENCES ROOM (room_no)
;


ALTER TABLE ROOM_OPTION
	ADD FOREIGN KEY (option_code)
	REFERENCES ROOM_OPTION_LIST (option_code)
;


ALTER TABLE ROOM
	ADD FOREIGN KEY (rm_type_code)
	REFERENCES ROOM_TYPES (rm_type_code)
;



/* Comments */

COMMENT ON COLUMN ROOM.state IS '거래중
완료
보류';




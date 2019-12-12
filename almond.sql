
/* Drop Tables */

DROP TABLE commLikes CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE score CASCADE CONSTRAINTS;
DROP TABLE ticketUse CASCADE CONSTRAINTS;
DROP TABLE reading CASCADE CONSTRAINTS;
DROP TABLE episode CASCADE CONSTRAINTS;

DROP TABLE book CASCADE CONSTRAINTS;
DROP TABLE cash CASCADE CONSTRAINTS;
DROP TABLE eventhistory CASCADE CONSTRAINTS;
DROP TABLE Event CASCADE CONSTRAINTS;
DROP TABLE giftHistory CASCADE CONSTRAINTS;
DROP TABLE gift CASCADE CONSTRAINTS;
DROP TABLE inquiry CASCADE CONSTRAINTS;
DROP TABLE myList CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE search CASCADE CONSTRAINTS;
DROP TABLE ticketBuy CASCADE CONSTRAINTS;
DROP TABLE ticket CASCADE CONSTRAINTS;
DROP TABLE ticketStock CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE video CASCADE CONSTRAINTS;
DROP TABLE webcontents CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_alarm_alarmnum;
DROP SEQUENCE SEQ_cash_cashnum;
DROP SEQUENCE SEQ_comments_commnum;
DROP SEQUENCE SEQ_commLikes_likenum;	
DROP SEQUENCE SEQ_episode_epinum;
DROP SEQUENCE SEQ_eventHistory_eventhnum;
DROP SEQUENCE SEQ_Event_eventnum;	
DROP SEQUENCE SEQ_giftHistory_gifthnum;
DROP SEQUENCE SEQ_gift_giftnum;	
DROP SEQUENCE SEQ_inquiry_inqnum;	
DROP SEQUENCE SEQ_myList_mylistnum;	
DROP SEQUENCE SEQ_notice_noticenum;	
DROP SEQUENCE SEQ_reading_readingnum;	
DROP SEQUENCE SEQ_score_scorenum;	
DROP SEQUENCE SEQ_search_searchnum;
DROP SEQUENCE SEQ_ticketBuy_tkbnum;	
DROP SEQUENCE SEQ_ticketUse_tkunum;	
DROP SEQUENCE SEQ_ticket_tknum;	
DROP SEQUENCE SEQ_ticketStock_tksnum;	
DROP SEQUENCE SEQ_users_usernum;
DROP SEQUENCE SEQ_webcontents_contnum;	




/* Create Sequences */

CREATE SEQUENCE SEQ_alarm_alarmnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_cash_cashnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_comments_commnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_commLikes_likenum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_episode_epinum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_eventHistory_eventhnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_Event_eventnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_giftHistory_gifthnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_gift_giftnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_inquiry_inqnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_myList_mylistnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_notice_noticenum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_reading_readingnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_score_scorenum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_search_searchnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_ticketBuy_tkbnum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_ticketUse_tkunum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_ticket_tknum INCREMENT BY 1 START WITH 1;	
CREATE SEQUENCE SEQ_ticketStock_tksnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_users_usernum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_webcontents_contnum INCREMENT BY 1 START WITH 1;	



/* Create Tables */



-- 좋아요
CREATE TABLE commLikes
(
	-- 좋아요번호
	likenum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 댓글번호
	commnum number NOT NULL,
	-- 좋/싫타입 : 0 : 취소
	-- 1 : 좋아요
	-- 2 : 싫어요
	type number NOT NULL,
	PRIMARY KEY (likenum)
);



-- 작품댓글
CREATE TABLE comments
(
	-- 댓글번호
	commnum number NOT NULL,
	-- 회차번호
	epinum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 내용
	content varchar2(300),
	-- 그룹
	ref number NOT NULL,
	-- 레벨
	lev number NOT NULL,
	-- 순서
	step number,
	-- 등록일
	regdate date NOT NULL,
	PRIMARY KEY (commnum)
);



-- 별점
CREATE TABLE score
(
	-- 별점번호
	scorenum number NOT NULL,
	-- 회차번호
	epinum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 별점
	score number,
	PRIMARY KEY (scorenum)
);




-- 티켓사용
CREATE TABLE ticketUse
(
	-- 티켓사용번호
	tkunum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 회차번호
	epinum number NOT NULL,
	-- 사용일
	usedate date NOT NULL,
	-- 소장/대여 타입 : 1 : 소장
	-- 2 : 대여
	type number,
	PRIMARY KEY (tkunum)
);



-- 열람
CREATE TABLE reading
(
	-- 열람번호
	readingnum number NOT NULL,
	-- 회차번호
	epinum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 열람날짜
	readingdate date NOT NULL,
	-- 상태 1:소장, 2:대여, 3:무료
	type number NOT NULL,
	PRIMARY KEY (readingnum)
);



-- 회차정보
CREATE TABLE episode
(
	-- 회차번호
	epinum number NOT NULL,
	-- 작품번호
	contnum number NOT NULL,
	-- 업로드 날짜
	uploaddate date NOT NULL,
	-- 조회수
	hit number NOT NULL,
	-- 썸네일 저장이름
	thumbnail varchar2(200),
	-- 소제목
	subtitle varchar2(100),
	-- 이미지 저장이름
	img varchar2(200),
	-- 내용
	content clob,
	-- 회차번호
	epnum number NOT NULL,
	PRIMARY KEY (epinum)
);




















-- 책
CREATE TABLE book
(
	-- 작품번호
	contnum number NOT NULL,
	-- 글작가
	writer varchar2(50) NOT NULL,
	-- 그림작가
	illustrator varchar2(50),
	-- 출판사
	publisher varchar2(50),
	dayofweek varchar2(10),
	PRIMARY KEY (contnum)
);


-- 캐쉬내역
CREATE TABLE cash
(
	-- 캐쉬거래번호
	cashnum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 금액
	price number NOT NULL,
	-- 등록일
	regdate date NOT NULL,
	-- 결제방식
	method varchar2(50),
	PRIMARY KEY (cashnum)
);






-- 캐쉬이벤트
CREATE TABLE event
(
	-- 이벤트번호
	eventnum number NOT NULL,
	-- 작품번호
	contnum number,
	-- 제목
	title varchar2(100),
	-- 내용
	content varchar2(1000),
	-- 등록일
	regdate date NOT NULL,
	-- 시작일
	startdate date NOT NULL,
	-- 종료일
	enddate date NOT NULL,
	-- 이미지
	img varchar2(200),
	-- 상태 : 10 : 열람 -> 추첨
	-- 11 : 열람 -> 룰렛
	-- 
	-- 20 : 리뷰 -> 추첨
	-- 21 : 리뷰 -> 룰렛
	-- 
	-- 31 : 룰렛 -> 1000
	-- 32 : 룰렛 -> 3000
	-- 33 : 룰렛 -> 5000
	-- 
	-- 40 : 키워드
	stauts number NOT NULL,
	-- 사용기한 : 0 : 사용기한 없음
	-- 1 : 1시간
	-- 24 : 하루
	-- 48 : 2일
	usebydate number,
	-- 키워드
	keyword varchar2(100),
	-- 지급액
	price number,
	PRIMARY KEY (eventnum)
);




-- 이벤트 내역
CREATE TABLE eventhistory
(
	-- 이벤트 내역번호
	eventhnum number NOT NULL,
	-- 이벤트번호
	eventnum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 받은날
	regdate date NOT NULL,
	-- 금액
	price number NOT NULL,
	PRIMARY KEY (eventhnum)
);







-- 선물함
CREATE TABLE gift
(
	-- 선물번호
	giftnum number NOT NULL,
	-- 작품번호
	contnum number NOT NULL,
	-- 개수
	cnt number NOT NULL,
	-- 소장권/대여권 : 1 : 소장권
	-- 2 : 대여권
	type number NOT NULL,
	PRIMARY KEY (giftnum)
);


-- 선물함 내역
CREATE TABLE giftHistory
(
	-- 선물함내역번호
	gifthnum number NOT NULL,
	-- 선물번호
	giftnum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 받은날
	regdate date,
	PRIMARY KEY (gifthnum)
);


-- 1:1 문의하기
CREATE TABLE inquiry
(
	-- 문의하기번호
	inqnum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 제목
	title varchar2(100),
	-- 내용
	content clob,
	-- 상태 : 1 : 대기
	-- 2 : 완료
	status number,
	-- 그룹
	ref number,
	-- 레벨
	lev number,
	-- 순서
	step number NOT NULL,
	PRIMARY KEY (inqnum)
);


-- 보관함
CREATE TABLE myList
(
	-- 보관함번호
	mylistnum number NOT NULL,
	-- 작품번호
	contnum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 알람상태 : 0 : 알람해제
	-- 1 : 알람설정
	alaram number NOT NULL,
	-- 업데이트 날짜
	readingdate date NOT NULL,
	PRIMARY KEY (mylistnum)
);


-- 공지사항
CREATE TABLE notice
(
	-- 공지사항번호
	noticenum number NOT NULL,
	-- 제목
	title varchar2(100),
	-- 내용
	content clob,
	-- 등록일
	regdate date NOT NULL,
	PRIMARY KEY (noticenum)
);



-- 검색어
CREATE TABLE search
(
	-- 검색어번호
	searchnum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 검색어
	searchword varchar2(100),
	-- 검색날
	searchdate date NOT NULL,
	PRIMARY KEY (searchnum)
);


-- 이용권
CREATE TABLE ticket
(
	-- 이용권번호
	tknum number NOT NULL,
	-- 카테고리타입
	cultype number NOT NULL,
	-- 개수1
	cnt1 number NOT NULL,
	-- 개수2
	cnt2 number,
	-- 개수3
	cnt3 number,
	-- 대여금액1
	rentalprice1 number NOT NULL,
	-- 대여금액2
	rentalprice2 number,
	-- 대여금액3
	rentalprice3 number,
	-- 소장금액1
	ownprice1 number NOT NULL,
	-- 소장금액2
	ownprice2 number,
	-- 소장금액3
	ownprice3 number,
	PRIMARY KEY (tknum)
);


-- 이용권구매/캐쉬사용 내역
CREATE TABLE ticketBuy
(
	-- 티켓구매번호
	tkbnum number NOT NULL,
	-- 유저번호
	usernum number NOT NULL,
	-- 회원번호
	contnum number NOT NULL,
	-- 소장/대여권 : 1 : 소장권
	-- 2 : 대여권
	type number NOT NULL,
	-- 개수
	cnt number NOT NULL,
	-- 금액 : 전체 금액
	price number NOT NULL,
	-- 구매일
	regdate date NOT NULL,
	PRIMARY KEY (tkbnum)
);


-- 티켓 재고
CREATE TABLE ticketStock
(
	-- 티켓재고번호
	tksnum number NOT NULL,
	-- 회원번호
	usernum number NOT NULL,
	-- 작품번호
	contnum number NOT NULL,
	-- 타입 : 1: 소장
	-- 2 : 대여
	type number NOT NULL,
	-- 개수
	cnt number,
	PRIMARY KEY (tksnum)
);


-- 회원정보
CREATE TABLE users
(
	-- 회원번호
	usernum number NOT NULL,
	-- 이메일
	email varchar2(50) NOT NULL,
	-- 비밀번호
	pwd varchar2(15) NOT NULL,
	-- 전화번호
	phone varchar2(13),
	-- 닉네임
	nickname varchar2(20) NOT NULL,
	-- 프로필사진
	profileimg varchar2(100),
	-- 캐시
	cash number NOT NULL,
	-- 상태 : 1 : 일반
	-- 2 : 탈퇴
	status number,
	PRIMARY KEY (usernum)
);


-- 영상물
CREATE TABLE video
(
	-- 작품번호
	contnum number NOT NULL,
	-- 감독
	director varchar2(30) NOT NULL,
	-- 출연진
	actor varchar2(100),
	-- 상영시간(분)
	runtime number,
	-- 제작일
	proddate date,
	PRIMARY KEY (contnum)
);


-- 컨텐츠
CREATE TABLE webcontents
(
	-- 작품번호
	contnum number NOT NULL,
	-- 작품명
	title varchar2(100) NOT NULL,
	-- 책/영상물 : 1 : 웹툰
	-- 2 : 소설
	-- 3 : 예능
	-- 4 : 드라마
	-- 5 : 영화
	cultype number NOT NULL,
	-- 장르
	genre varchar2(100) NOT NULL,
	-- 줄거리(소개글)
	outline varchar2(1000),
	-- 이용권번호
	tknum number NOT NULL,
	-- 기다림시간
	waiting number NOT NULL,
	-- 이미지저장이름
	img varchar2(200),
	-- 완결여부 : 1 : 연재 중
	-- 0 : 완결
	completiontype number NOT NULL,
	-- 나이등급
	agegrade number NOT NULL,
	-- 무료회차 : default : 0
	freenum number NOT NULL,
	-- 상태 : 0 : 미공개
	-- 1 : 공개
	status number NOT NULL,
	readernum number NOT NULL,
	PRIMARY KEY (contnum)
);



/* Create Foreign Keys */

ALTER TABLE commLikes
	ADD FOREIGN KEY (commnum)
	REFERENCES comments (commnum)
;


ALTER TABLE comments
	ADD FOREIGN KEY (epinum)
	REFERENCES episode (epinum)
;


ALTER TABLE reading
	ADD FOREIGN KEY (epinum)
	REFERENCES episode (epinum)
;


ALTER TABLE score
	ADD FOREIGN KEY (epinum)
	REFERENCES episode (epinum)
;


ALTER TABLE ticketUse
	ADD FOREIGN KEY (epinum)
	REFERENCES episode (epinum)
;


ALTER TABLE eventhistory
	ADD FOREIGN KEY (eventnum)
	REFERENCES event (eventnum)
;

ALTER TABLE event
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE giftHistory
	ADD FOREIGN KEY (giftnum)
	REFERENCES gift (giftnum)
;


ALTER TABLE ticketBuy
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE webcontents
	ADD FOREIGN KEY (tknum)
	REFERENCES ticket (tknum)
;


ALTER TABLE cash
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE comments
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE commLikes
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;



ALTER TABLE eventhistory
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE giftHistory
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE inquiry
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE myList
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE reading
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE score
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE search
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE ticketBuy
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE ticketUse
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE ticketStock
	ADD FOREIGN KEY (usernum)
	REFERENCES users (usernum)
;


ALTER TABLE book
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE episode
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;




ALTER TABLE gift
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE myList
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE ticketStock
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE video
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;



insert into users values(seq_users_usernum.nextval,'admin@naver.com','1234',null,'관리자',null,0,0);



insert into ticket values(-1,1, 1,10,20, 0,0,0, 0,0,0);
insert into ticket values(seq_ticket_tknum.nextval,1, 1,10,20, 200,2000,4000, 400,4000,8000);
insert into ticket values(seq_ticket_tknum.nextval,1, 1,10,20, 200,1800,3400, 400,3600,7000);
insert into ticket values(seq_ticket_tknum.nextval,1, 1,10,20, 300,3000,6000, 500,5000,10000);
insert into ticket values(seq_ticket_tknum.nextval,1, 1,10,20, 300,2700,5100, 500,4500,8500);

insert into ticket values(seq_ticket_tknum.nextval,1, 1,20,60, 200,4000,12000, 400,8000,24000);
insert into ticket values(seq_ticket_tknum.nextval,1, 1,20,60, 200,3600,10600, 400,7200,22000);
insert into ticket values(seq_ticket_tknum.nextval,1, 1,20,60, 300,6000,18000, 500,10000,30000);
insert into ticket values(seq_ticket_tknum.nextval,1, 1,20,60, 300,5100,15600, 500,8500,26000);


insert into ticket values(-2,2, 1,10,20, 0,0,0, 0,0,0);
insert into ticket values(seq_ticket_tknum.nextval,2, 1,10,20, -1,-1,-1, 100,1000,2000);
insert into ticket values(seq_ticket_tknum.nextval,2, 1,10,20, -1,-1,-1, 100,800,1400);

insert into ticket values(seq_ticket_tknum.nextval,2, 1,20,40, -1,-1,-1, 100,2000,4000);
insert into ticket values(seq_ticket_tknum.nextval,2, 1,20,40, -1,-1,-1, 100,1800,3400);

insert into ticket values(seq_ticket_tknum.nextval,2, 1,30,60, -1,-1,-1, 100,3000,6000);
insert into ticket values(seq_ticket_tknum.nextval,2, 1,30,60, -1,-1,-1, 100,2600,5200);



insert into ticket values(-3,3, 1,5,10, 0,0,0, 0,0,0);
insert into ticket values(seq_ticket_tknum.nextval,3, 1,5,10, 300,1500,3000, -1,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,3, 1,5,10, 300,1200,2100, -1,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,3, 1,5,10, 500,2500,5000, -1,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,3, 1,5,10, 500,2000,4000, -1,-1,-1);



insert into ticket values(-4,4, 1,5,10, 0,0,0, 0,0,0);
insert into ticket values(seq_ticket_tknum.nextval,4, 1,5,10, 300,1500,3000, -1,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,4, 1,5,10, 300,1200,2100, -1,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,4, 1,5,10, 500,2500,5000, -1,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,4, 1,5,10, 500,2000,4000, -1,-1,-1);



insert into ticket values(-5,5, 1,-1,-1, 0,0,0, 0,0,0);
insert into ticket values(seq_ticket_tknum.nextval,5, 1,-1,-1, 100,-1,-1, -1,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,5, 1,-1,-1, 300,-1,-1, -1,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,5, 1,-1,-1, 1000,-1,-1, 3000,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,5, 1,-1,-1, 3000,-1,-1, 6000,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,5, 1,-1,-1, 4000,-1,-1, 9000,-1,-1);
insert into ticket values(seq_ticket_tknum.nextval,5, 1,-1,-1, 5000,-1,-1, 12000,-1,-1);






commit;





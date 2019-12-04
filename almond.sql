
/* Drop Tables */

DROP TABLE book CASCADE CONSTRAINTS;
DROP TABLE cash CASCADE CONSTRAINTS;
DROP TABLE commLikes CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE couponHistory CASCADE CONSTRAINTS;
DROP TABLE coupon CASCADE CONSTRAINTS;
DROP TABLE reading CASCADE CONSTRAINTS;
DROP TABLE score CASCADE CONSTRAINTS;
DROP TABLE ticketUse CASCADE CONSTRAINTS;
DROP TABLE episode CASCADE CONSTRAINTS;
DROP TABLE eventhistory CASCADE CONSTRAINTS;
DROP TABLE Eventcash CASCADE CONSTRAINTS;
DROP TABLE eventroulette CASCADE CONSTRAINTS;
DROP TABLE giftHistory CASCADE CONSTRAINTS;
DROP TABLE gift CASCADE CONSTRAINTS;
DROP TABLE inquiry CASCADE CONSTRAINTS;
DROP TABLE myList CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE search CASCADE CONSTRAINTS;
DROP TABLE ticketBuy CASCADE CONSTRAINTS;
DROP TABLE ticket CASCADE CONSTRAINTS;
DROP TABLE tiketStock CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE video CASCADE CONSTRAINTS;
DROP TABLE webcontents CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_alarm_alarmnum;
DROP SEQUENCE SEQ_cash_cashnum;	/**/
DROP SEQUENCE SEQ_comments_commnum;	/**/
DROP SEQUENCE SEQ_commLikes_likenum;	/**/
DROP SEQUENCE SEQ_couponHistory_couphnum;	/**/
DROP SEQUENCE SEQ_coupon_coupnum;	/**/
DROP SEQUENCE SEQ_episode_epinum;	/**/
DROP SEQUENCE SEQ_eventHistory_eventhnum;	/**/
DROP SEQUENCE SEQ_Eventcash_eventnum;	/**/
DROP SEQUENCE SEQ_eventroulette_eventnum;	/**/
DROP SEQUENCE SEQ_giftHistory_gifthnum;	/**/
DROP SEQUENCE SEQ_gift_giftnum;	/**/
DROP SEQUENCE SEQ_inquiry_inqnum;	/**/
DROP SEQUENCE SEQ_myList_mylistnum;	/**/
DROP SEQUENCE SEQ_notice_noticenum;	/**/
DROP SEQUENCE SEQ_reading_readingnum;	/**/
DROP SEQUENCE SEQ_roulletteEvent_eventnum;
DROP SEQUENCE SEQ_score_scorenum;	/**/
DROP SEQUENCE SEQ_search_searchnum;	/**/
DROP SEQUENCE SEQ_ticketBuy_tkbnum;	/**/
DROP SEQUENCE SEQ_ticketUse_tkunum;	/**/
DROP SEQUENCE SEQ_ticket_tknum;	/**/
DROP SEQUENCE SEQ_tiketStock_tksnum;	/**/
DROP SEQUENCE SEQ_webcontents_contnum;	/**/




/* Create Sequences */

CREATE SEQUENCE SEQ_alarm_alarmnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_cash_cashnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_comments_commnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_commLikes_likenum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_couponHistory_couphnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_coupon_coupnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_episode_epinum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_eventHistory_eventhnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_Eventcash_eventnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_eventroulette_eventnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_giftHistory_gifthnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_gift_giftnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_inquiry_inqnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_myList_mylistnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_notice_noticenum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_reading_readingnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_roulletteEvent_eventnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_score_scorenum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_search_searchnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_ticketBuy_tkbnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_ticketUse_tkunum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_ticket_tknum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_tiketStock_tksnum INCREMENT BY 1 START WITH 1;	/**/
CREATE SEQUENCE SEQ_webcontents_contnum INCREMENT BY 1 START WITH 1;	/**/



/* Create Tables */

-- å
CREATE TABLE book
(
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ���۰�
	writer varchar2(50) NOT NULL,
	-- �׸��۰�
	illustrator varchar2(50),
	-- ���ǻ�
	publisher varchar2(50),
	PRIMARY KEY (contnum)
);


-- ĳ������
CREATE TABLE cash
(
	-- ĳ���ŷ���ȣ
	cashnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- �ݾ�
	price number NOT NULL,
	-- �����
	regdate date NOT NULL,
	-- �������
	method varchar2(50),
	PRIMARY KEY (cashnum)
);


-- ��ǰ���
CREATE TABLE comments
(
	-- ��۹�ȣ
	commnum number NOT NULL,
	-- ȸ����ȣ
	epinum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ����
	content varchar2(300),
	-- �׷�
	ref number NOT NULL,
	-- ����
	lev number NOT NULL,
	-- ����
	step number,
	-- �����
	regdate date NOT NULL,
	PRIMARY KEY (commnum)
);


-- ���ƿ�
CREATE TABLE commLikes
(
	-- ���ƿ��ȣ
	likenum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ��۹�ȣ
	commnum number NOT NULL,
	-- ��/��Ÿ�� : 0 : ���
	-- 1 : ���ƿ�
	-- 2 : �Ⱦ��
	type number NOT NULL,
	PRIMARY KEY (likenum)
);


-- ����
CREATE TABLE coupon
(
	-- ������ȣ
	coupnum number NOT NULL,
	-- Ű����
	keyword varchar2(50) NOT NULL,
	-- �����
	regdate date NOT NULL,
	-- ������
	startdate date NOT NULL,
	-- ����
	enddate date NOT NULL,
	-- ���޾�
	price number NOT NULL,
	-- ������
	usebydate number NOT NULL,
	PRIMARY KEY (coupnum)
);


-- ��������
CREATE TABLE couponHistory
(
	-- ����������ȣ
	couphnum number NOT NULL,
	-- ������ȣ
	coupnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- �����
	regdate date NOT NULL,
	-- �ݾ�
	price number NOT NULL,
	PRIMARY KEY (couphnum)
);


-- ȸ������
CREATE TABLE episode
(
	-- ȸ����ȣ
	epinum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ���ε� ��¥
	uploaddate date NOT NULL,
	-- ��ȸ��
	hit number NOT NULL,
	-- �̹��� �����̸�
	img varchar2(100),
	-- ����
	content clob,
	PRIMARY KEY (epinum)
);


-- �̺�Ʈ ����
CREATE TABLE eventhistory
(
	-- �̺�Ʈ ������ȣ
	eventhnum number NOT NULL,
	-- �̺�Ʈ��ȣ
	eventnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ������
	regdate date NOT NULL,
	-- �ݾ�
	price number NOT NULL,
	-- Ÿ�� : 1 : point
	-- 2 : roulette
	type number NOT NULL,
	PRIMARY KEY (eventhnum)
);


-- ����Ʈ�̺�Ʈ
CREATE TABLE eventcash
(
	-- �̺�Ʈ��ȣ
	eventnum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ����
	title varchar2(100),
	-- ����
	content varchar2(1000),
	-- �����
	regdate date NOT NULL,
	-- ������
	startdate date NOT NULL,
	-- ������
	enddate date NOT NULL,
	-- �ݾ�
	price number NOT NULL,
	-- ������
	usebydate number NOT NULL,
	PRIMARY KEY (eventnum)
);


-- �귿�̺�Ʈ
CREATE TABLE eventroulette
(
	-- �̺�Ʈ��ȣ
	eventnum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ����
	title varchar2(100),
	-- ����
	content clob,
	-- �����
	regdate date NOT NULL,
	-- ���ѵ� �ο���
	headcount number NOT NULL,
	-- �ݾ�1
	price1 number,
	-- �ݾ�2
	price2 number,
	-- �ݾ�3
	price3 number,
	-- �ݾ�4
	price4 number,
	-- ������
	usebydate number,
	PRIMARY KEY (eventnum)
);


-- ������
CREATE TABLE gift
(
	-- ������ȣ
	giftnum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ����
	cnt number NOT NULL,
	-- �����/�뿩�� : 1 : �����
	-- 2 : �뿩��
	usetype number NOT NULL,
	PRIMARY KEY (giftnum)
);


-- ������ ����
CREATE TABLE giftHistory
(
	-- �����Գ�����ȣ
	gifthnum number NOT NULL,
	-- ������ȣ
	giftnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ������
	regdate date,
	PRIMARY KEY (gifthnum)
);


-- 1:1 �����ϱ�
CREATE TABLE inquiry
(
	-- �����ϱ��ȣ
	inqnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ����
	title varchar2(100),
	-- ����
	content clob,
	-- ���� : 1 : ���
	-- 2 : �Ϸ�
	status number,
	-- �׷�
	ref number,
	-- ����
	lev number,
	-- ����
	step number NOT NULL,
	PRIMARY KEY (inqnum)
);


-- ������
CREATE TABLE myList
(
	-- �����Թ�ȣ
	mylistnum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- �˶����� : 0 : �˶�����
	-- 1 : �˶�����
	alaram number NOT NULL,
	PRIMARY KEY (mylistnum)
);


-- ��������
CREATE TABLE notice
(
	-- �������׹�ȣ
	noticenum number NOT NULL,
	-- ����
	title varchar2(100),
	-- ����
	content clob,
	-- �����
	regdate date NOT NULL,
	PRIMARY KEY (noticenum)
);


-- ����
CREATE TABLE reading
(
	-- ������ȣ
	readingnum number NOT NULL,
	-- ȸ����ȣ
	epinum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ������¥
	readingdate date NOT NULL,
	PRIMARY KEY (readingnum)
);


-- ����
CREATE TABLE score
(
	-- ������ȣ
	scorenum number NOT NULL,
	-- ȸ����ȣ
	epinum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ����
	score number,
	PRIMARY KEY (scorenum)
);


-- �˻���
CREATE TABLE search
(
	-- �˻����ȣ
	searchnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- �˻���
	searchword varchar2(100),
	-- �˻���
	searchdate date NOT NULL,
	PRIMARY KEY (searchnum)
);


-- �̿��
CREATE TABLE ticket
(
	-- �̿�ǹ�ȣ
	tknum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ����
	cnt number NOT NULL,
	-- �뿩�ݾ�
	rentalprice number NOT NULL,
	-- ����ݾ�
	ownprice number NOT NULL,
	PRIMARY KEY (tknum)
);


-- �̿�Ǳ���/ĳ����� ����
CREATE TABLE ticketBuy
(
	-- Ƽ�ϱ��Ź�ȣ
	tkbnum number NOT NULL,
	-- �̿�ǹ�ȣ
	tknum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- �����/�뿩�� : 1 : �����
	-- 2 : �뿩��
	type number NOT NULL,
	-- ������
	regdate date NOT NULL,
	PRIMARY KEY (tkbnum)
);


-- Ƽ�ϻ��
CREATE TABLE ticketUse
(
	-- Ƽ�ϻ���ȣ
	tkunum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ȸ����ȣ
	epinum number NOT NULL,
	-- �����
	usedate date NOT NULL,
	-- ����/�뿩 Ÿ�� : 1 : ����
	-- 2 : �뿩
	type number,
	PRIMARY KEY (tkunum)
);


-- Ƽ�� ���
CREATE TABLE tiketStock
(
	-- Ƽ�������ȣ
	tksnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ����
	cnt number,
	-- Ÿ�� : 1: ����
	-- 2 : �뿩
	type number NOT NULL,
	PRIMARY KEY (tksnum)
);


-- ȸ������
CREATE TABLE users
(
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- �̸���
	email varchar2(50) NOT NULL,
	-- ��й�ȣ
	pwd varchar2(15) NOT NULL,
	-- ��ȭ��ȣ
	phone varchar2(13),
	-- �г���
	nickname varchar2(20) NOT NULL,
	-- �����ʻ���
	profileimg varchar2(100),
	-- ĳ��
	cash number NOT NULL,
	-- ���� : 1 : �Ϲ�
	-- 2 : Ż��
	status number,
	PRIMARY KEY (usernum)
);


-- ����
CREATE TABLE video
(
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- ����
	director varchar2(30) NOT NULL,
	-- �⿬��
	actor varchar2(100),
	-- �󿵽ð�(��)
	runtime number,
	-- ������
	proddate date,
	PRIMARY KEY (contnum)
);


-- ������
CREATE TABLE webcontents
(
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	title varchar2(100) not null,
	-- å/���� : 1 : ����
	-- 2 : �Ҽ�
	-- 3 : ��ȭ
	-- 4 : ���
	-- 5 : ����
	cultype number NOT NULL,
	-- �帣
	genre varchar2(100) NOT NULL,
	-- �ٰŸ�(�Ұ���)
	outline varchar2(500),
	-- ����
	price number NOT NULL,
	-- ��ٸ��ð�
	waiting number NOT NULL,
	-- �̹��������̸�
	img varchar2(100),
	-- �ϰῩ�� : 1 : ���� ��
	-- 0 : �ϰ�
	completiontype number NOT NULL,
	-- ���̵��
	agegrade number NOT NULL,
	-- ����ȸ�� : default : 0
	freenum number NOT NULL,
	PRIMARY KEY (contnum)
);



/* Create Foreign Keys */

ALTER TABLE commLikes
	ADD FOREIGN KEY (commnum)
	REFERENCES comments (commnum)
;


ALTER TABLE couponHistory
	ADD FOREIGN KEY (coupnum)
	REFERENCES coupon (coupnum)
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
	REFERENCES eventcash (eventnum)
;


ALTER TABLE eventhistory
	ADD FOREIGN KEY (eventnum)
	REFERENCES eventroulette (eventnum)
;


ALTER TABLE giftHistory
	ADD FOREIGN KEY (giftnum)
	REFERENCES gift (giftnum)
;


ALTER TABLE ticketBuy
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


ALTER TABLE couponHistory
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


ALTER TABLE tiketStock
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


ALTER TABLE eventcash
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE eventroulette
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


ALTER TABLE ticket
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE tiketStock
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


ALTER TABLE video
	ADD FOREIGN KEY (contnum)
	REFERENCES webcontents (contnum)
;


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
	-- ���� 1:����, 2:�뿩, 3:����
	type number NOT NULL,
	PRIMARY KEY (readingnum)
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
	-- ����� �����̸�
	thumbnail varchar2(200),
	-- ������
	subtitle varchar2(100),
	-- �̹��� �����̸�
	img varchar2(200),
	-- ����
	content clob,
	-- ȸ����ȣ
	epnum number NOT NULL,
	PRIMARY KEY (epinum)
);




















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
	dayofweek varchar2(10),
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






-- ĳ���̺�Ʈ
CREATE TABLE event
(
	-- �̺�Ʈ��ȣ
	eventnum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number,
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
	-- �̹���
	img varchar2(200),
	-- ���� : 10 : ���� -> ��÷
	-- 11 : ���� -> �귿
	-- 
	-- 20 : ���� -> ��÷
	-- 21 : ���� -> �귿
	-- 
	-- 31 : �귿 -> 1000
	-- 32 : �귿 -> 3000
	-- 33 : �귿 -> 5000
	-- 
	-- 40 : Ű����
	stauts number NOT NULL,
	-- ������ : 0 : ������ ����
	-- 1 : 1�ð�
	-- 24 : �Ϸ�
	-- 48 : 2��
	usebydate number,
	-- Ű����
	keyword varchar2(100),
	-- ���޾�
	price number,
	PRIMARY KEY (eventnum)
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
	PRIMARY KEY (eventhnum)
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
	type number NOT NULL,
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
	-- ������Ʈ ��¥
	readingdate date NOT NULL,
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
	-- ī�װ�Ÿ��
	cultype number NOT NULL,
	-- ����1
	cnt1 number NOT NULL,
	-- ����2
	cnt2 number,
	-- ����3
	cnt3 number,
	-- �뿩�ݾ�1
	rentalprice1 number NOT NULL,
	-- �뿩�ݾ�2
	rentalprice2 number,
	-- �뿩�ݾ�3
	rentalprice3 number,
	-- ����ݾ�1
	ownprice1 number NOT NULL,
	-- ����ݾ�2
	ownprice2 number,
	-- ����ݾ�3
	ownprice3 number,
	PRIMARY KEY (tknum)
);


-- �̿�Ǳ���/ĳ����� ����
CREATE TABLE ticketBuy
(
	-- Ƽ�ϱ��Ź�ȣ
	tkbnum number NOT NULL,
	-- ������ȣ
	usernum number NOT NULL,
	-- ȸ����ȣ
	contnum number NOT NULL,
	-- ����/�뿩�� : 1 : �����
	-- 2 : �뿩��
	type number NOT NULL,
	-- ����
	cnt number NOT NULL,
	-- �ݾ� : ��ü �ݾ�
	price number NOT NULL,
	-- ������
	regdate date NOT NULL,
	PRIMARY KEY (tkbnum)
);


-- Ƽ�� ���
CREATE TABLE ticketStock
(
	-- Ƽ������ȣ
	tksnum number NOT NULL,
	-- ȸ����ȣ
	usernum number NOT NULL,
	-- ��ǰ��ȣ
	contnum number NOT NULL,
	-- Ÿ�� : 1: ����
	-- 2 : �뿩
	type number NOT NULL,
	-- ����
	cnt number,
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
	-- ��ǰ��
	title varchar2(100) NOT NULL,
	-- å/���� : 1 : ����
	-- 2 : �Ҽ�
	-- 3 : ����
	-- 4 : ���
	-- 5 : ��ȭ
	cultype number NOT NULL,
	-- �帣
	genre varchar2(100) NOT NULL,
	-- �ٰŸ�(�Ұ���)
	outline varchar2(1000),
	-- �̿�ǹ�ȣ
	tknum number NOT NULL,
	-- ��ٸ��ð�
	waiting number NOT NULL,
	-- �̹��������̸�
	img varchar2(200),
	-- �ϰῩ�� : 1 : ���� ��
	-- 0 : �ϰ�
	completiontype number NOT NULL,
	-- ���̵��
	agegrade number NOT NULL,
	-- ����ȸ�� : default : 0
	freenum number NOT NULL,
	-- ���� : 0 : �̰���
	-- 1 : ����
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



insert into users values(seq_users_usernum.nextval,'admin@naver.com','1234',null,'������',null,0,0);



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





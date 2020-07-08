-- 실시간 채팅 테이블 생성
CREATE TABLE rtqna (
	qna_code  NUMBER      NOT NULL, -- 실시간 채팅 번호
	mem_code  NUMBER      NULL,     -- 회원 번호
	qna_state VARCHAR2(20) NULL      -- 실시간 채팅 상태
);

-- 실시간 채팅 시퀀스 생성
CREATE SEQUENCE rtqna_seq
INCREMENT BY 1
START WITH 42000000
MINVALUE 42000000
MAXVALUE 42999999;

-- 실시간 채팅
ALTER TABLE rtqna
	ADD
		CONSTRAINT PK_rtqna -- 실시간 채팅 기본키
		PRIMARY KEY (
			qna_code -- 실시간 채팅 번호
		);

-- 실시간 채팅
ALTER TABLE rtqna
	ADD
		CONSTRAINT FK_member_TO_rtqna -- 회원 -> 실시간 채팅
		FOREIGN KEY (
			mem_code -- 회원 번호
		)
		REFERENCES member ( -- 회원
			mem_code -- 회원 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;


	
----------------------------------------------------------------
-- 실시간채팅 내용 테이블 생성
CREATE TABLE rtqna_detail (
	qna_detail_code NUMBER         NOT NULL, -- 실시간채팅 내용 번호
	qna_code        NUMBER         NULL,     -- 실시간 채팅 번호
	qna_time        DATE           NOT NULL, -- 실시간 채팅 전송 시간
	qna_writer      NUMBER         NOT NULL, -- 실시간 채팅 작성자
	qna_detail      VARCHAR2(1000) NULL      -- 실시간 채팅 내용
);

-- 실시간채팅 내용 시퀀스 생성
CREATE SEQUENCE rtqna_detail_seq
START WITH 1
INCREMENT BY 1;

-- 실시간채팅 내용 기본키
CREATE UNIQUE INDEX PK_rtqna_detail
	ON rtqna_detail ( -- 실시간채팅 내용
		qna_detail_code ASC -- 실시간채팅 내용 번호
	);

-- 실시간채팅 내용
ALTER TABLE rtqna_detail
	ADD
		CONSTRAINT PK_rtqna_detail -- 실시간채팅 내용 기본키
		PRIMARY KEY (
			qna_detail_code -- 실시간채팅 내용 번호
		);

-- 실시간채팅 내용
ALTER TABLE rtqna_detail
	ADD
		CONSTRAINT FK_rtqna_TO_rtqna_detail -- 실시간 채팅 -> 실시간채팅 내용
		FOREIGN KEY (
			qna_code -- 실시간 채팅 번호
		)
		REFERENCES rtqna ( -- 실시간 채팅
			qna_code -- 실시간 채팅 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;	
	


----------------------------------------------------------------
-- 공지사항 테이블 생성
CREATE TABLE notice (
	noti_code     NUMBER         NOT NULL, -- 공지사항 번호
	noti_title    VARCHAR2(100)  NOT NULL, -- 공지사항 제목
	noti_detail   VARCHAR2(2000) NOT NULL, -- 공지사항 내용
	noti_reg_date DATE           NOT NULL, -- 공지사항 등록 날짜
	noti_upt_date DATE           NULL,     -- 공지사항 수정 날짜
	noti_ck	  	  VARCHAR2(1)	 NOT NULL, -- 공지사항 중요여부(Y or N)
	admin_code    NUMBER         NOT NULL  -- 관리자 사번
);
-- 공지사항 시퀀스 생성
CREATE SEQUENCE notice_seq
INCREMENT BY 1
START WITH 43000000
MINVALUE 43000000
MAXVALUE 43999999;

-- 공지사항
ALTER TABLE notice
ADD
CONSTRAINT PK_notice -- 공지사항 기본키
PRIMARY KEY (
	noti_code -- 공지사항 번호
);

-- 공지사항
ALTER TABLE notice
ADD
CONSTRAINT FK_admin_TO_notice -- 관리자 -> 공지사항
FOREIGN KEY (
	admin_code -- 관리자 사번
)
REFERENCES admin ( -- 관리자
	admin_code -- 관리자 사번
)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- 공지사항 중요여부 check 제약사항
ALTER TABLE notice  
ADD CONSTRAINT CK_noti_ck CHECK (noti_ck IN ('Y', 'N') );

----------------------------------------------------------------
-- FAQ 테이블 생성
CREATE TABLE faq (
	faq_code     NUMBER         NOT NULL, -- FAQ 번호
	faq_title    VARCHAR2(100)  NOT NULL, -- FAQ 제목
	faq_detail   VARCHAR2(2000) NOT NULL, -- FAQ 내용
	faq_reg_date DATE           NOT NULL, -- FAQ 등록 날짜
	faq_upt_date DATE           NULL,     -- FAQ 수정 날짜
	admin_code   NUMBER         NOT NULL  -- 관리자 사번
);
-- FAQ 시퀀스 생성
CREATE SEQUENCE faq_seq
INCREMENT BY 1
START WITH 44000000
MINVALUE 44000000
MAXVALUE 44999999;

-- FAQ
ALTER TABLE faq
ADD
CONSTRAINT PK_faq -- FAQ 기본키
PRIMARY KEY (
	faq_code -- FAQ 번호
);

-- FAQ
ALTER TABLE faq
ADD
CONSTRAINT FK_admin_TO_faq -- 관리자 -> FAQ
FOREIGN KEY (
	admin_code -- 관리자 사번
)
REFERENCES admin ( -- 관리자
admin_code -- 관리자 사번
)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

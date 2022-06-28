--TB_CERTI
DROP TABLE EZEN.TB_CERTI purge;
CREATE TABLE EZEN.TB_CERTI(
	CERTI_CD CHAR(6) NOT NULL
	,CERTI_NM VARCHAR2(150) NOT NULL
	,ISSUE_INSTI_NM VARCHAR2(150) NOT NULL
);

ALTER TABLE EZEN.TB_CERTI ADD CONSTRAINT PK_TB_CERTI PRIMARY KEY(CERTI_CD);

COMMENT ON COLUMN EZEN.TB_CERTI.CERTI_CD IS '자격증코드';
COMMENT ON COLUMN EZEN.TB_CERTI.CERTI_NM IS '자격증명';
COMMENT ON COLUMN EZEN.TB_CERTI.ISSUE_INSTI_NM IS '발행기관명';
COMMENT ON TABLE EZEN.TB_CERTI IS '자격증';


--TB_DEPT
DROP TABLE EZEN.TB_DEPT purge;
CREATE TABLE EZEN.TB_DEPT(
	DEPT_CD CHAR(6) NOT NULL
	,DEPT_NM VARCHAR2(150) NOT NULL
	,UPPER_DEPT_CD CHAR(6)
);

ALTER TABLE EZEN.TB_DEPT ADD CONSTRAINT PK_TB_DEPT PRIMARY KEY(DEPT_CD);
ALTER TABLE EZEN.TB_DEPT ADD CONSTRAINT FK_TB_DEPT FOREIGN KEY(DEPT_CD) REFERENCES EZEN.TB_DEPT(DEPT_CD);

COMMENT ON COLUMN EZEN.TB_DEPT.DEPT_CD IS '부서코드';
COMMENT ON COLUMN EZEN.TB_DEPT.DEPT_NM IS '부서명';
COMMENT ON COLUMN EZEN.TB_DEPT.UPPER_DEPT_CD IS '상위부서코드';
COMMENT ON TABLE EZEN.TB_DEPT IS '부서';


-- TB_EMP
DROP TABLE EZEN.TB_EMP purge;
CREATE TABLE EZEN.TB_EMP (
	EMP_NO 				CHAR(10) NOT NULL
	,EMP_NAME 			VARCHAR2(150) NOT NULL
	,BIRTH_DE 			CHAR(8) NOT NULL
	,LUNAR_YN			CHAR(1) NOT NULL
	,SEX_CD 			CHAR(3) NOT NULL
	,ADDR 				VARCHAR2(1000) NOT NULL
	,TEL_NO 			CHAR(150) NOT NULL
	,FINAL_EDU_SE_CD 	CHAR(3) NOT NULL
	,SAL_TRANS_BANK_CD 	CHAR(3) NOT NULL
	,SAL_TRANS_ACCNT_NO VARCHAR2(20) NOT NULL
	,DIRECT_MANAGER_EMP_NO CHAR(10)
	,DEPT_CD 			CHAR(6) NOT NULL
);

ALTER TABLE EZEN.TB_EMP ADD CONSTRAINT PK_TB_EMP PRIMARY KEY(EMP_NO);
--
ALTER TABLE EZEN.TB_EMP ADD CONSTRAINT FK_TB_EMP FOREIGN KEY(DEPT_CD) REFERENCES EZEN.TB_DEPT(DEPT_CD);
--
ALTER TABLE EZEN.TB_EMP ADD CONSTRAINT FK_TB_EMP02 FOREIGN KEY(EMP_NO) REFERENCES EZEN.TB_EMP(EMP_NO);

COMMENT ON COLUMN EZEN.TB_EMP.EMP_NO IS '사원번호';
COMMENT ON COLUMN EZEN.TB_EMP.EMP_NAME IS '사원명';
COMMENT ON COLUMN EZEN.TB_EMP.BIRTH_DE IS '생년월일';
COMMENT ON COLUMN EZEN.TB_EMP.SEX_CD IS '성별코드';
COMMENT ON COLUMN EZEN.TB_EMP.ADDR IS '주소';
COMMENT ON COLUMN EZEN.TB_EMP.TEL_NO IS '전화번호';
COMMENT ON COLUMN EZEN.TB_EMP.LUNAR_YN IS '음력여부';
COMMENT ON COLUMN EZEN.TB_EMP.FINAL_EDU_SE_CD IS '최종학력구분코드';
COMMENT ON COLUMN EZEN.TB_EMP.SAL_TRANS_BANK_CD IS '급여이체은행코드';
COMMENT ON COLUMN EZEN.TB_EMP.SAL_TRANS_ACCNT_NO IS '급여이체계좌번호';
COMMENT ON COLUMN EZEN.TB_EMP.DIRECT_MANAGER_EMP_NO IS '직속상사사원번호';
COMMENT ON COLUMN EZEN.TB_EMP.DEPT_CD IS '부서코드';
COMMENT ON TABLE  EZEN.TB_EMP IS '사원';

-- TB_EMP_CERTI
DROP TABLE EZEN.TB_EMP_CERTI purge;
CREATE TABLE EZEN.TB_EMP_CERTI (
    EMP_NO CHAR(10) NOT NULL
    ,CERTI_SN CHAR(3) NOT NULL
    ,ACQU_DE CHAR(8) NOT NULL
    ,CERTI_CD CHAR(6) NOT NULL
);

ALTER TABLE EZEN.TB_EMP_CERTI ADD CONSTRAINT PK_TB_EMP_CERTI PRIMARY KEY (EMP_NO, CERTI_SN);
--
ALTER TABLE EZEN.TB_EMP_CERTI ADD CONSTRAINT FK_TB_EMP_CERTI01 FOREIGN KEY(EMP_NO) REFERENCES EZEN.TB_EMP(EMP_NO);
--
ALTER TABLE EZEN.TB_EMP_CERTI ADD CONSTRAINT FK_TB_EMP_CERTI02 FOREIGN KEY(CERTI_CD) REFERENCES EZEN.TB_CERTI(CERTI_CD);

COMMENT ON COLUMN EZEN.TB_EMP_CERTI.EMP_NO IS '사원번호';
COMMENT ON COLUMN EZEN.TB_EMP_CERTI.CERTI_SN IS '자격증순번';
COMMENT ON COLUMN EZEN.TB_EMP_CERTI.ACQU_DE IS '취득일자';
COMMENT ON COLUMN EZEN.TB_EMP_CERTI.CERTI_CD IS '자격증코드';
COMMENT ON TABLE  EZEN.TB_EMP_CERTI IS '사원자격증';

-- TB_SAL
DROP TABLE EZEN.TB_SAL purge;
CREATE TABLE EZEN.TB_SAL(
    SAL_CD  CHAR(6) NOT NULL
    ,SAL_NM VARCHAR2(150) NOT NULL
);

ALTER TABLE EZEN.TB_SAL ADD CONSTRAINT PK_TB_SAL PRIMARY KEY (SAL_CD);

COMMENT ON COLUMN EZEN.TB_SAL.SAL_CD IS '급여코드';
COMMENT ON COLUMN EZEN.TB_SAL.SAL_NM IS '급여명';
COMMENT ON TABLE EZEN.TB_SAL IS '급여';

INSERT INTO EZEN.TB_SAL t (t.sal_cd, t.sal_nm) VALUES ('100001', '기본급');
INSERT INTO EZEN.TB_SAL t (t.sal_cd, t.sal_nm) VALUES ('100002', '상여금');
INSERT INTO EZEN.TB_SAL t (t.sal_cd, t.sal_nm) VALUES ('100003', '특별상여금');
INSERT INTO EZEN.TB_SAL t (t.sal_cd, t.sal_nm) VALUES ('100004', '야근수당');
INSERT INTO EZEN.TB_SAL t (t.sal_cd, t.sal_nm) VALUES ('100005', '주말수당');
INSERT INTO EZEN.TB_SAL t (t.sal_cd, t.sal_nm) VALUES ('100006', '점심식대');
INSERT INTO EZEN.TB_SAL t (t.sal_cd, t.sal_nm) VALUES ('100007', '복지포인트');
COMMIT;


-- TB_SAL_HIS
DROP TABLE EZEN.TB_SAL_HIS PURGE;
CREATE TABLE EZEN.TB_SAL_HIS (
    SAL_HIS_NO  CHAR(14) NOT NULL
    ,PAY_DE     CHAR(8) NOT NULL
    ,PAY_AMT    NUMBER(15) NOT NULL
    ,EMP_NO CHAR(10) NOT NULL
);

ALTER TABLE EZEN.TB_SAL_HIS ADD CONSTRAINT PK_TB_SAL_HIS PRIMARY KEY (SAL_HIS_NO);
--
ALTER TABLE EZEN.TB_SAL_HIS ADD CONSTRAINT FK_TB_SAL_HIS01 FOREIGN KEY(EMP_NO) REFERENCES EZEN.TB_EMP(EMP_NO);

COMMENT ON COLUMN EZEN.TB_SAL_HIS.SAL_HIS_NO IS '급여내역번호';
COMMENT ON COLUMN EZEN.TB_SAL_HIS.PAY_DE IS '지급일자';
COMMENT ON COLUMN EZEN.TB_SAL_HIS.PAY_AMT IS '지급금액';
COMMENT ON COLUMN EZEN.TB_SAL_HIS.EMP_NO IS '사원번호';
COMMENT ON TABLE EZEN.TB_SAL_HIS IS '급여내역';


-- TB_SAL_HIS_DTL
DROP TABLE EZEN.TB_SAL_HIS_DTL PURGE;
CREATE TABLE EZEN.TB_SAL_HIS_DTL(
    SAL_HIS_NO  CHAR(14) NOT NULL
    ,DTL_SN     CHAR(3) NOT NULL
    ,SAL_CD     CHAR(6) NOT NULL
    ,PAY_DTL_AMT NUMBER(15) NOT NULL
);

ALTER TABLE EZEN.TB_SAL_HIS_DTL ADD CONSTRAINT PK_TB_SAL_HIS_DTL PRIMARY KEY (SAL_HIS_NO, DTL_SN);
--
ALTER TABLE EZEN.TB_SAL_HIS_DTL ADD CONSTRAINT FK_TB_SAL_HIS_DTL01 FOREIGN KEY(SAL_HIS_NO) REFERENCES TB_SAL_HIS(SAL_HIS_NO);
--
ALTER TABLE EZEN.TB_SAL_HIS_DTL ADD CONSTRAINT FK_TB_SAL_HIS_DTL02 FOREIGN KEY(SAL_CD) REFERENCES TB_SAL(SAL_CD);

COMMENT ON COLUMN EZEN.TB_SAL_HIS_DTL.SAL_HIS_NO IS '급여내역번호';
COMMENT ON COLUMN EZEN.TB_SAL_HIS_DTL.DTL_SN IS '상세번호';
COMMENT ON COLUMN EZEN.TB_SAL_HIS_DTL.SAL_CD IS '지급상세금액';
COMMENT ON COLUMN EZEN.TB_SAL_HIS_DTL.PAY_DTL_AMT IS '급여코드';
COMMENT ON TABLE EZEN.TB_SAL_HIS_DTL IS '급여내역상세';


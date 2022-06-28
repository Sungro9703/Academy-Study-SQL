--【문항1】 TB_EMP 테이블에 CHAR 1바이트 크기의 본사근무여부(HEAD_WORK_YN) 컬럼을
-- 추가하고자 한다. 올바른 DDL문은 무엇인가? (오라클 기준) (10점)
ALTER TABLE TB_EMP ADD HEAD_WORK_YN CHAR(1);


--【문항2】 2019년의 평균급여액수가 450만원 이상인 직원을 출력하는 SQL문을 작성하시오. (10점)
SELECT
	(SELECT EMP_NAME FROM TB_EMP B WHERE B.EMP_NO = A.EMP_NO) AS EMP_NAME
FROM TB_SAL_HIS A 
WHERE A.PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY A.EMP_NO
HAVING AVG(A.PAY_AMT) >= 4500000
;


--【문항3】 주소가 수원인 직원의 사원번호, 사원명, 주소, 부서코드, 부서명, 자격증코드를 출력하시오. (10점)
SELECT A.EMP_NO 
	,A.EMP_NAME 
	,A.ADDR 
	,A.DEPT_CD 
	,B.DEPT_NM 
	,C.CERTI_CD 
FROM TB_EMP A
	,TB_DEPT B
	,TB_CERTI C
WHERE A.DEPT_CD = B.DEPT_CD
AND A.ADDR LIKE '%수원%'
;


--【문항4】 부서명이 지원팀인 직원의 사원번호, 사원명, 부서코드, 부서명, 보유자격증 코드 및 자격증명을 
--		  출력하시오. (10점)
SELECT A.EMP_NO 
	,A.EMP_NAME 
	,A.DEPT_CD 
	,B.DEPT_NM 
	,C.CERTI_CD
	,C.CERTI_NM
FROM TB_EMP A
	,TB_DEPT B
	,TB_CERTI C
WHERE A.DEPT_CD = B.DEPT_CD
AND B.DEPT_NM = '지원팀'
;


--【문항5】 아래의 SQL문은 ORDER BY절을 이용해 결과 집합을 정렬한 SQL문이다.
--결과 집합의 정렬 순서가 동일한 ORDER BY절의 내용을 작성하시오.  (10점)

--SELECT
--A.CERTI_CD
--, A.CERTI_NM
--, A.ISSUE_INSTI_NM
--FROM TB_CERTI A
--ORDER BY A.ISSUE_INSTI_NM DESC, A.CERTI_CD ASC;
SELECT
A.CERTI_CD
, A.CERTI_NM
, A.ISSUE_INSTI_NM
FROM TB_CERTI A
ORDER BY 3 DESC, 1 ASC;


--【문항6】 4개의 테이블을 조인하여 필요한 집합 및 컬럼들을 조회하고자 한다.
-- 최소 몇개의 조인 조건이 필요한가? (10점)

-- 3개의 조인 조건


--【문항7】 관리자사원번호의 값이 널인 레코드를 찾아내는 쿼리문을 작성하시오. (10점)
SELECT *
FROM TB_DEPT A
WHERE A.UPPER_DEPT_CD IS NULL
;


--【문항8】 급여내역번호, 지급일자, 지급금액, 사원번호를 출력할 때 지급금액을 3000으로 나누었을 때의 몫이 
--		  5이상인 사원들을 출력하시오. (10점)
SELECT A.SAL_HIS_NO
	,A.PAY_DE 
	,A.PAY_AMT
	,A.EMP_NO 
FROM TB_SAL_HIS A
WHERE (A.PAY_AMT/3000) >= 5
;


--【문항9】 각부서별 급여의 평균을 구하는 평균값이 낮은 것부터 출력하시오 (소수점 이하 둘째자리까지출력) (10점) 
SELECT 
	B.DEPT_CD 
	,ROUND(AVG(A.PAY_AMT), 2)
FROM TB_SAL_HIS A
	,TB_EMP B
WHERE B.EMP_NO = A.EMP_NO 
GROUP BY B.DEPT_CD 
ORDER BY ROUND(AVG(A.PAY_AMT), 2) ASC
;


--【문항10】 각 부서의 직원수가 3명 이상인 부서만 출력하시오. (10점)
SELECT A.DEPT_CD 
	, (SELECT B.DEPT_NM  FROM TB_DEPT B WHERE B.DEPT_CD = A.DEPT_CD) AS DEPT_NM 
	, COUNT(*) AS "직원수"
FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING (COUNT(*)) >= 3
ORDER BY A.DEPT_CD  
;







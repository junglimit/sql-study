

-- WHERE 조건절
-- 조회 행을 제한
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd = 2 -- 조건 걸기
;

-- PK로 필터링하면 무조건 1건 이하가 조회됨
-- 0건 조회는 오류가 아님
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE emp_no = 1000000003
;

-- 비교 연산자

SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd <> 2 -- !=과 같음 
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE Birth_de >= '19800101'
    AND birth_de <= '19891231'
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE Birth_de  BETWEEN '19900101' AND '19991231' -- 이상 이하     
;


-- BETWEEN 연산자
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE Birth_de BETWEEN '19900101' AND '19991231' -- 이상 이하     
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE Birth_de NOT BETWEEN '19900101' AND '19991231' -- 이상 이하     
;

-- IN 연산 : OR 연산

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = 100002
    OR dept_cd = 100007
;

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd IN (100002,100007,100008) -- 여러개 한번에 조회할때 OR거는거랑 같은 효과
;

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd NOT IN (100002,100007,100008)
;

-- LIKE
-- 검색에서 사용
-- 와일드카드 매핑 ( %: 0글자 이상, _: 딱 1글자 )

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '이%'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '이__'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '%심'
;

SELECT
    email
FROM user
WHERE email LIKE '_A%@%';

-- 성씨가 김씨이면서 
-- 부서가 100003, 100004 중에 하나면서
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회

SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
WHERE 1=1 -- 주석처리하기 편하게 첫줄에 true걸고 전부 AND로 시작
    AND emp_nm LIKE '김%'
    AND dept_cd IN (100003,100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;


-- NULL값 조회
-- 반드시 IS NULL로 조회할 것!
SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
-- null은 비교연산자 사용X
WHERE direct_manager_emp_no IS NULL 
;

SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
-- NOT을 쓸때 null은 꼭 is와 null 사이에 넣기
WHERE direct_manager_emp_no IS NOT NULL 
;


-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE EMP_NM LIKE '김%'
	AND (ADDR LIKE '%수원%' -- AND가 먼저 처리되어서 괄호가 묶임
    OR ADDR LIKE '%일산%')
;
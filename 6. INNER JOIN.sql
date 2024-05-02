

-- 사원의 사번, 이름, 부서번호, 부서명 조회

SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
;

-- JOIN
SELECT
    tb_emp.emp_no,
    tb_emp.emp_nm,
    tb_dept.dept_cd,
    tb_dept.dept_nm
FROM tb_emp, tb_dept
WHERE tb_emp.dept_cd = tb_dept.dept_cd
;


-- 조인 기초 테스트 데이터
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, 'ㄱㄱㄱ', 1);
INSERT INTO TEST_B  VALUES (2, 'ㄴㄴㄴ', 1);
INSERT INTO TEST_B  VALUES (3, 'ㄷㄷㄷ', 2);
INSERT INTO TEST_B  VALUES (4, 'ㄹㄹㄹ', 3);

SELECT 
    *
FROM TEST_A
;

SELECT
    *
FROM TEST_B
;

-- JOIN: 곱하기연산 // 중첩 for문
-- Cartesian production : product연산
-- Cross Join: 가능한 모든 경우의 수를 매칭하여 조회

SELECT
    *
FROM test_a, test_b
;


-- INNER JOIN
-- 두 테이블 간에 연관컬럼을 이용하여
-- 관계가 있는 데이터를 매칭하여 조인
SELECT
    *
FROM test_a, test_b
WHERE test_a.id = test_b.a_id
;

SELECT
    E.emp_no,
    E.emp_nm,
    E.addr,
    D.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D -- Oracle JOIN
WHERE E.dept_cd = D.dept_cd
;

-- 사원의 사원번호와 사원명과 취득한 자격증 이름을 조회 // 3개의 테이블 JOIN 필요
SELECT
    E.emp_no,
    E.emp_nm,
    EC.certi_cd,
    EC.acqu_de,
    C.certi_nm
FROM tb_emp E, tb_emp_certi EC, tb_certi C
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
ORDER BY E.emp_no
;

-- 사원의 사원번호와 사원명과 취득한 자격증 이름, 부서명 조회
SELECT
    E.emp_no,
    E.emp_nm,
    EC.certi_cd,
    EC.acqu_de,
    C.certi_nm,
    D.dept_nm
FROM tb_emp E, tb_emp_certi EC, tb_certi C, tb_dept D
WHERE E.emp_no = EC.emp_no -- 조건 안걸어주면 전체목록에 다 매칭조회함 꼭 조건 걸기
    AND EC.certi_cd = C.certi_cd
    AND E.dept_cd = D.dept_cd
    AND D.dept_nm = '개발팀' -- 개발팀 추가 필터링
-- Oracle JOIN으로 하다보니까 WHERE절에 AND가 너무 많아짐
ORDER BY E.emp_no
;

-- 부서별로 총 자격증 취득 갯수를 조회
SELECT
    D.dept_cd 부서코드,
    D.dept_nm 부서이름, 
    COUNT(EC.certi_cd) AS "자격증 취득 갯수"
FROM tb_dept D,
     tb_emp_certi EC, -- 회원정보 + 자격증정보 // 근데 겹치는 컬럼이 없음
     tb_emp E
WHERE E.dept_cd = D.dept_cd
    AND E.emp_no = EC.emp_no
GROUP BY D.dept_cd, D.dept_nm
;

-- # INNER JOIN
-- 1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법입니다.
-- 2. WHERE절에 사용된 컬럼들이 동등연산자(=)에 의해 조인됩니다.

-- 용인시에 사는 사원의 사원번호, 사원명, 주소, 부서코드, 부서명을 조회하고 싶다.
SELECT
    E.emp_no 사원번호,
    E.emp_nm 사원명,
    E.addr 주소,
    E.dept_cd 부서코드,
    D.dept_nm 부서명
FROM tb_emp E, tb_dept D
WHERE E.addr LIKE '%용인%'
   AND E.dept_cd = D.dept_cd
   AND E.emp_nm LIKE '김%' -- 김씨 추가필터링
;

-- JOIN ON (ANSI 표준 조인)
-- 1. FROM절 뒤, WHERE 절 앞
-- 2. JOIN 키워드 뒤에는 조인할 테이블명을 명시
-- 3. ON 키워드 뒤에는 조인 조건을 명시
-- 4. 조인 조건 서술부(ON절) 일반 조건 서술부 (WHERE절)를 분리해서 작성하는 방법
-- 5. ON절을 이용하면 JOIN 이후의 논리연산이나 서브쿼리와 같은 추가 서술이 가능

SELECT
    E.emp_no 사원번호,
    E.emp_nm 사원명,
    E.addr 주소,
    E.dept_cd 부서코드,
    D.dept_nm 부서명
FROM tb_emp E 
INNER -- 생략되어있는 조건 // 안쓰면 default가 INNER
JOIN tb_dept D -- 콤마 대신 JOIN쓰기
ON E.dept_cd = D.dept_cd -- JOIN의 조건만 ON 뒤에 쓰기
WHERE E.addr LIKE '%용인%'
   AND E.emp_nm LIKE '김%' 
;

SELECT
    E.emp_no,
    E.emp_nm,
    D.dept_nm,
    E.sex_cd,
    EC.certi_cd,
    C.certi_nm,
    EC.acqu_de
FROM tb_emp E 
-- JOIN 조건은 JOIN ON으로 따로 
JOIN tb_emp_certi EC 
ON E.emp_no = EC.emp_no
JOIN tb_certi C 
ON EC.certi_cd = C.certi_cd
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
-- 일반 필터링 조건은 WHERE
WHERE E.dept_cd IN (100004, 100006)
    AND EC.acqu_de >= '20180101'
;

-- 1980년대생 사원들의 사번, 사원명, 부서, 부서명, 자격증명, 취득일자 조회

SELECT 
    E.emp_no,
    E.emp_nm,
    D.dept_nm,
    c.certi_nm,
    EC.acqu_de
FROM tb_emp E, tb_dept D, tb_certi C, tb_emp_certi EC
WHERE E.dept_cd = D.dept_cd
    AND E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
    AND E.birth_de BETWEEN'19800101' AND '19891231'
;

SELECT 
    E.emp_no,
    E.emp_nm,
    D.dept_nm,
    c.certi_nm,
    EC.acqu_de
FROM tb_emp E 
JOIN tb_dept D 
ON E.dept_cd = D.dept_cd
JOIN tb_emp_certi EC
ON E.emp_no = EC.emp_no
JOIN tb_certi C 
ON EC.certi_cd = C.certi_cd
WHERE E.birth_de BETWEEN'19800101' AND '19891231'
;

-- INNER JOIN은 두 테이블간에
-- 연관데이터가 있는 경우에만 사용
-- ex) 어떤 쇼핑몰 회원이 한 건도 주문하지 않은 경우
--     INNER JOIN 에서는 해당 회원이 조회되지 않음

-- [SELECT 쓰는 순서]
-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];

-- [SELECT 실행 순서]
-- FROM  테이블 또는 뷰 이름
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- SELECT [DISTINCT] { 열이름 .... }
-- ORDER BY  정렬할 열 [ASC | DESC];



-- 조인 조건을 안걸면 카테시안 곱이 만들어짐
-- 크로스조인 (오라클)
SELECT
    *
FROM test_a, test_b
;

-- 크로스조인 (표준)
SELECT
    *
FROM test_a
CROSS JOIN test_b
;

-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동으로 조인조건을 생성하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이 때 조인되는 동일 이름의 컬럼은 데이터 타입이 같아야 하며, 
--    ALIAS나 테이블명을 자동 조인 컬럼 앞에 표기하면 안됩니다. (중요)
-- 4. SELECT * 문법을 사용하면, 공통 컬럼은 집합에서 한번만 표기됩니다.
-- 5. 공통 컬럼이 n개 이상이면 조인 조건이 n개로 처리됩니다.

-- 사원 테이블과 부서 테이블을 조인 (사번, 사원명, 부서코드, 부서명)
SELECT 
    A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

 -- dept_cd 가 중복으로 있으니 ON절로 작성하는 부분을
 -- NATURAL을 써주면 알아서 겹치는 부분을 정리해줌
 -- NATURAL JOIN에서는 겹치는 컬럼에 식별자를 명시하면 안됨!!!!!!
SELECT 
    A.emp_no, A.emp_nm, dept_cd, B.dept_nm
    --*
FROM tb_emp A
NATURAL JOIN tb_dept B
--ON A.dept_cd = B.dept_cd
;

SELECT
    *
FROM test_a A
INNER JOIN test_b B
ON A.id = B.a_id -- 컬럼명이 달라서 NATURAL JOIN이 안됨(카테시안 곱으로 실행)
;

-- # USING절 조인
-- 1. NATURAL조인에서는 자동으로 이름과 타입이 일치하는 모든 컬럼에 대해
--    조인이 일어나지만 USING을 사용하면 원하는 컬럼에 대해서면 선택적 조인조건을 
--    부여할 수 있습니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 표기하시면 안됩니다.

SELECT 
    A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A
NATURAL JOIN tb_dept B
;


SELECT 
    A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

SELECT 
    A.emp_no,
    A.emp_nm,
    dept_cd, -- USING도 식별자 기재 X
    B.dept_nm
FROM tb_emp A
JOIN tb_dept B
USING(dept_cd)
;













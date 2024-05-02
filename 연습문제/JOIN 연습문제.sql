-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id,
    E.first_name,
    E.last_name,
    D.department_id,
    D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
;

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id,
    E.first_name,
    E.last_name,
    department_id,
    D.department_name
FROM employees E
NATURAL JOIN departments D
;

-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id,
    E.first_name,
    E.last_name,
    department_id,
    D.department_name
FROM employees E
JOIN departments D
USING (department_id)
;

-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
SELECT
    E.employee_id,
    E.first_name,
    D.department_name,
    L.city
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
JOIN locations L
ON D.location_id = L.location_id
;
-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.
SELECT
    E.first_name,
    E.last_name,
    J.job_title
FROM employees E
JOIN jobs J
ON E.job_id = J.job_id
ORDER BY E.employee_id
;
-- 6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.
SELECT 
    D.department_name 부서명,
    MAX(E.salary) "최대 급여값"
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
GROUP BY D.department_name
ORDER BY MAX(E.salary)
;
-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.
SELECT
    D.department_name,
    TO_CHAR(ROUND( AVG(salary),2), '$9999,999,99')
FROM employees E
JOIN jobs J
ON E.job_id = J.job_id
JOIN departments D
ON E.department_id = D.department_id
GROUP BY D.department_name 
;
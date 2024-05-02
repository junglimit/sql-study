


-- 사원의 first_name, employee_id, department_id, dept_name 조회
SELECT
    E.employee_id,
    E.first_name,
    E.department_id,
    D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
ORDER BY e.employee_id
;

-- 공통 컬럼이 2개임 (department_id, manager_id)
SELECT
    E.employee_id,
    E.first_name,
    department_id, -- JOIN 컬럼 식별자기재 XXXXXXXXXXX
    D.department_name
FROM employees E
NATURAL JOIN departments D
ORDER BY e.employee_id
;
-- 위의 NATURAL JOIN은 아래처럼 ON절에 조건이 두개 추가된것과 같음
SELECT
    E.employee_id,
    E.first_name,
    E.department_id, 
    D.department_name
FROM employees E
JOIN departments D
ON e.department_id = d.department_id
 AND e.manager_id = d.manager_id
ORDER BY e.employee_id
;

-- USING
SELECT
    E.employee_id,
    E.first_name,
    department_id,
    D.department_name
FROM employees E
JOIN departments D
USING(department_id)
ORDER BY e.employee_id
;

SELECT
    E.employee_id,
    E.first_name,
    department_id, 
    D.department_name
FROM employees E
JOIN departments D
USING(department_id,manager_id) -- 두개의 ON이 필요한경우 USING을 사용할땐 콤마사용
ORDER BY e.employee_id
;








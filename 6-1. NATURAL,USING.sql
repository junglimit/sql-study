


-- ����� first_name, employee_id, department_id, dept_name ��ȸ
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

-- ���� �÷��� 2���� (department_id, manager_id)
SELECT
    E.employee_id,
    E.first_name,
    department_id, -- JOIN �÷� �ĺ��ڱ��� XXXXXXXXXXX
    D.department_name
FROM employees E
NATURAL JOIN departments D
ORDER BY e.employee_id
;
-- ���� NATURAL JOIN�� �Ʒ�ó�� ON���� ������ �ΰ� �߰��ȰͰ� ����
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
USING(department_id,manager_id) -- �ΰ��� ON�� �ʿ��Ѱ�� USING�� ����Ҷ� �޸����
ORDER BY e.employee_id
;








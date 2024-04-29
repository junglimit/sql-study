

-- WHERE ������
-- ��ȸ ���� ����
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd = 2 -- ���� �ɱ�
;

-- PK�� ���͸��ϸ� ������ 1�� ���ϰ� ��ȸ��
-- 0�� ��ȸ�� ������ �ƴ�
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE emp_no = 1000000003
;

-- �� ������

SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd <> 2 -- !=�� ���� 
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
WHERE Birth_de  BETWEEN '19900101' AND '19991231' -- �̻� ����     
;


-- BETWEEN ������
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE Birth_de BETWEEN '19900101' AND '19991231' -- �̻� ����     
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE Birth_de NOT BETWEEN '19900101' AND '19991231' -- �̻� ����     
;

-- IN ���� : OR ����

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
WHERE dept_cd IN (100002,100007,100008) -- ������ �ѹ��� ��ȸ�Ҷ� OR�Ŵ°Ŷ� ���� ȿ��
;

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd NOT IN (100002,100007,100008)
;

-- LIKE
-- �˻����� ���
-- ���ϵ�ī�� ���� ( %: 0���� �̻�, _: �� 1���� )

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '��%'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '��__'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '%��'
;

SELECT
    email
FROM user
WHERE email LIKE '_A%@%';

-- ������ �达�̸鼭 
-- �μ��� 100003, 100004 �߿� �ϳ��鼭
-- 90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ

SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
WHERE 1=1 -- �ּ�ó���ϱ� ���ϰ� ù�ٿ� true�ɰ� ���� AND�� ����
    AND emp_nm LIKE '��%'
    AND dept_cd IN (100003,100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;


-- NULL�� ��ȸ
-- �ݵ�� IS NULL�� ��ȸ�� ��!
SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
-- null�� �񱳿����� ���X
WHERE direct_manager_emp_no IS NULL 
;

SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
-- NOT�� ���� null�� �� is�� null ���̿� �ֱ�
WHERE direct_manager_emp_no IS NOT NULL 
;


-- ������ �켱 ����
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE EMP_NM LIKE '��%'
	AND (ADDR LIKE '%����%' -- AND�� ���� ó���Ǿ ��ȣ�� ����
    OR ADDR LIKE '%�ϻ�%')
;
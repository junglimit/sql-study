

-- Ʈ����� 
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2 (100),
    age NUMBER
);

INSERT INTO student VALUES (1, '��ö��', 15);
INSERT INTO student VALUES (2, 'ȫ�浿', 16);

SELECT * FROM student;

COMMIT;

INSERT INTO student VALUES (3, '�����', 12);

ROLLBACK;

-- ���� ��ü
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '��ö��';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '�ڿ���';

ROLLBACK; -- ������ �������� �ѹ� 
COMMIT; -- �ΰ��� �۾��� �Ϸ� �Ǿ����� Ŀ��

-- �ݺ����� ����ؼ� �� �پ� ������ : �αװ� ���� ��ϵ�, Ʈ���� �߻� ����
-- WHERE���� �Բ� ����ϱ�
DELETE FROM student;



-- TRUNCATE�� ���̺��� �����ϸ� �ѹ����� �ǵ��� �� ����
-- �ѹ��� ������ : �αװ� ���� ����, Ʈ����X
TRUNCATE TABLE student;




















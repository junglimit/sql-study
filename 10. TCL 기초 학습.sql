

-- 트랜잭션 
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2 (100),
    age NUMBER
);

INSERT INTO student VALUES (1, '김철수', 15);
INSERT INTO student VALUES (2, '홍길동', 16);

SELECT * FROM student;

COMMIT;

INSERT INTO student VALUES (3, '도우너', 12);

ROLLBACK;

-- 계좌 이체
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '김철수';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '박영희';

ROLLBACK; -- 문제가 생겼을땐 롤백 
COMMIT; -- 두가지 작업이 완료 되었을때 커밋

-- 반복문을 사용해서 한 줄씩 삭제됨 : 로그가 전부 기록됨, 트리거 발생 가능
-- WHERE절과 함께 사용하기
DELETE FROM student;



-- TRUNCATE로 테이블을 삭제하면 롤백으로 되돌릴 수 없음
-- 한번에 삭제함 : 로그가 남지 않음, 트리거X
TRUNCATE TABLE student;




















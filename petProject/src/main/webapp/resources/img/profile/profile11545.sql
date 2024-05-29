SELECT 
        COUNT(*) 
FROM 
        TB_INFO
JOIN
        TB_BOARD_ANIMAL USING(BOARD_NO)
WHERE
        BOARD_STATUS = 'Y'
AND
        ANIMAL_CODE = 'A2'
AND
        CATEGORY_CODE = 'I1';

SELECT 
        TB_INFO.BOARD_NO, CATEGORY_CODE, ANIMAL_CODE
FROM 
        (
        SELECT 
                BOARD_NO,
                CATEGORY_CODE,
                ROW_NUMBER() OVER(PARTITION BY BOARD_NO ORDER BY CATEGORY_CODE DESC ) AS rn
        FROM
                TB_INFO
        LEFT JOIN
                TB_BOARD_ANIMAL USING(BOARD_NO)
        )
WHERE rn = 1;

SELECT * FROM TB_INFO WHERE CATEGORY_CODE IN ('I1', 'I2');


-- BNO : 6,7,5834 : I1 / 8,9 : I2
INSERT INTO TB_BOARD_ANIMAL VALUES('A1', 6);
INSERT INTO TB_BOARD_ANIMAL VALUES('A3', 7);
INSERT INTO TB_BOARD_ANIMAL VALUES('A4', 5834);
INSERT INTO TB_BOARD_ANIMAL VALUES('A5', 8);
INSERT INTO TB_BOARD_ANIMAL VALUES('A6', 9);
SELECT * FROM TB_BOARD_ANIMAL;
SELECT * 
FROM TB_INFO
JOIN TB_BOARD_ANIMAL USING(BOARD_NO);





SELECT * FROM(
            SELECT 
                    BOARD_NO,
                    CATEGORY_CODE,
                    ANIMAL_CODE,
                    ANIMAL_NAME,
                    BOARD_STATUS,
                    BO_CATEGORY_NAME,
                    ROW_NUMBER() OVER(PARTITION BY BOARD_NO ORDER BY CATEGORY_CODE DESC ) AS rn
            FROM
                    TB_INFO
            LEFT JOIN
                    TB_BOARD_ANIMAL USING(BOARD_NO)
            LEFT JOIN
                    TB_ANIMAL USING(ANIMAL_CODE)
            LEFT JOIN
                    TB_BOARD_CATEGORY ON(BO_CATEGORY_CODE = CATEGORY_CODE)
            )
WHERE RN = 1
AND BOARD_STATUS = 'Y'
--AND ANIMAL_CODE = 'A1'
AND CATEGORY_CODE IN ('I1', 'I2');

SELECT * FROM TB_INFO WHERE CATEGORY_CODE IN ('I1', 'I2');


SELECT * FROM(
            SELECT 
                    BOARD_NO,
                    CATEGORY_CODE,
                    ANIMAL_NAME,
                    ROW_NUMBER() OVER(PARTITION BY BOARD_NO ORDER BY CATEGORY_CODE DESC ) AS rn
            FROM
                    TB_INFO
            LEFT JOIN
                    TB_BOARD_ANIMAL USING(BOARD_NO)
            LEFT JOIN
                    TB_ANIMAL USING(ANIMAL_CODE)
            )
WHERE RN = 1
AND CATEGORY_CODE IN ('I1', 'I2');





SELECT
				BOARD_NO,
				BOARD_TITLE,
				BOARD_CONTENT,
				CATEGORY_CODE
		FROM(
            SELECT 
                    BOARD_NO,
                    CATEGORY_CODE,
                    BOARD_TITLE,
                    BOARD_CONTENT,
                    ANIMAL_CODE,
                    ANIMAL_NAME,
                    BOARD_STATUS,
                    BO_CATEGORY_NAME,
                    ROW_NUMBER() OVER(PARTITION BY BOARD_NO ORDER BY CATEGORY_CODE DESC ) AS rn
            FROM
                    TB_INFO
            LEFT JOIN
                    TB_BOARD_ANIMAL USING(BOARD_NO)
            LEFT JOIN
                    TB_ANIMAL USING(ANIMAL_CODE)
            LEFT JOIN
                    TB_BOARD_CATEGORY ON(BO_CATEGORY_CODE = CATEGORY_CODE)
            )
		WHERE
				BOARD_STATUS = 'Y'
		AND
				RN = 1
        AND CATEGORY_CODE IN ('I1', 'I2');
        
         [ 표현법 ]
    DELETE FROM 테이블명
     WHERE 조건; => 생략가능
DELETE FROM TB_INFO WHERE CATEGORY_CODE IN ('I1', 'I2');

COMMIT;








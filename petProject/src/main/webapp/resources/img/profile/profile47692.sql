SELECT
		        BOARD_NO,
                MEMBER_NO,
		        NICKNAME BOARD_WRITER,
		        ANIMAL_NAME,
		        CREATE_DATE,
		        BOARD_TITLE,
		        BOARD_CONTENT,
		        BOARD_COUNT,
		        NVL(BOARD_LIKE, 0) BOARD_LIKE,
		        REPLY_COUNT + COMMENT_COUNT SUM_COUNT,
		        BOARD_STATUS,
		        CATEGORY_CODE,
		        ATT_PATH,
		        CHANGE_NAME
		FROM
		        TB_INFO
		LEFT JOIN
		        TB_BOARD_ANIMAL USING(BOARD_NO)
		LEFT JOIN
		        TB_ANIMAL USING(ANIMAL_CODE)
		LEFT JOIN
		        TB_MEMBER USING(MEMBER_NO)
		LEFT JOIN
		        (
		        SELECT 
		                COUNT(*) BOARD_LIKE, 
		                BOARD_NO 
		        FROM 
		                TB_LIKE 
		        GROUP BY 
		                BOARD_NO
		        ) USING (BOARD_NO)
		LEFT JOIN
		        (
		        SELECT 
		                BOARD_NO,
		                COUNT(REPLY_NO) REPLY_COUNT,
		                COUNT(COMMENT_NO) COMMENT_COUNT
		        FROM 
		                TB_INFO 
		        LEFT JOIN
		                TB_REPLY USING(BOARD_NO)
		        LEFT JOIN
		                TB_COMMENT USING(REPLY_NO)
		        GROUP BY
		                BOARD_NO
		        ) USING (BOARD_NO)
		left JOIN
		        TB_ATTACHMENT USING(BOARD_NO)
		WHERE
				BOARD_STATUS = 'Y'
			AND
				MEMBER_NO = 3
		ORDER BY 
				BOARD_NO DESC   
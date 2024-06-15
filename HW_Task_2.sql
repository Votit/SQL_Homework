-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DELIMITER //
CREATE PROCEDURE even_numbers_output()
BEGIN
	DECLARE result VARCHAR(50) DEFAULT '';
    DECLARE num INT DEFAULT 1;
    
    WHILE num <= 11 DO
		IF num % 2 = 0 THEN SET result = CONCAT(result, num, ',');
        END IF;
        SET num = num + 1;
    END WHILE;
    
    SELECT result;
    
END //
DELIMITER ;

CALL even_numbers_output();
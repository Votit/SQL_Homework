-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION convert_sec_to_date(n BIGINT)
RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(150) DEFAULT '';
    
    SET result = CONCAT(FLOOR(n / 86400), ' days ');
    SET n = n - (86400 * FLOOR(n / 86400));
    SET result = CONCAT(result, FLOOR(n / 3600), ' hours ');
    SET n = n - (3600 * FLOOR(n / 3600));
    SET result = CONCAT(result, FLOOR(n / 60), ' minutes ');
    SET n = n - (60 * FLOOR(n / 60));
    SET result = CONCAT(result, n, ' seconds');
	
    RETURN result;

END //
DELIMITER ;

SELECT convert_sec_to_date(123456) AS TIME;
Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, 
профиль и запись из таблицы users. Функция должна возвращать номер пользователя.

USE `vk`;
DROP function IF EXISTS `funс_delete_user`;

DELIMITER $$
USE `vk`$$
CREATE FUNCTION funс_delete_user (user_id_del INT)
RETURNS INT reads sql data
BEGIN

    DELETE 
    FROM `vk`.`likes` l
    WHERE l.user_id = user_id_del;
    
    DELETE 
    FROM `vk`.`users_communities` uc
    WHERE uc.user_id = user_id_del;
    
    DELETE 
    FROM `vk`.`messages` m
    WHERE m.to_user_id = user_id_del 
        OR m.from_user_id = user_id_del;
    
    DELETE 
    FROM `vk`.`friend_requests` fr
    WHERE fr.initiator_user_id = user_id_del 
        OR fr.target_user_id = user_id_del;

    DELETE l
    FROM `vk`.`media` m
    JOIN `vk`.`likes` l ON l.media_id = m.id
    WHERE m.user_id = user_id_del;
    
    UPDATE `vk`.`profiles` p
    JOIN `vk`.`media` m ON p.photo_id = m.id
    SET p.photo_id = NULL
    WHERE m.user_id = user_id_del;

    DELETE 
    FROM `vk`.`media` m
    WHERE m.user_id = user_id_del;

    DELETE 
    FROM `vk`.`profiles` p
    WHERE p.user_id = user_id_del;
    
    DELETE 
    FROM `vk`.`users` u
    WHERE u.id = user_id_del;
    
    RETURN user_id_del;

END;$$

DELIMITER ;

select `vk`.`funс_delete_user`(2)

Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в 
транзакцию внутри процедуры.

USE `vk`;
DROP procedure IF EXISTS `delete_user_proc`;

DELIMITER $$
USE `vk`$$
CREATE PROCEDURE delete_user_proc (user_id_del INT)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    
    BEGIN
        ROLLBACK;
    END;

	START TRANSACTION;
    
		DELETE 
        FROM `vk`.`likes` l
		WHERE l.user_id = user_id_del;
    
		DELETE 
        FROM `vk`.`users_communities` uc
		WHERE uc.user_id = user_id_del;
    
		DELETE 
        FROM `vk`.`messages` m
		WHERE m.to_user_id = user_id_del 
            OR m.from_user_id = user_id_del;
    
		DELETE 
        FROM `vk`.`friend_requests` fr
		WHERE fr.initiator_user_id = user_id_del 
            OR fr.target_user_id = user_id_del;
    
		DELETE l
		FROM `vk`.`media` m
		JOIN `vk`.`likes` l ON l.media_id = m.id
		WHERE m.user_id = user_id_del;
    
		UPDATE `vk`.`profiles` p
		JOIN `vk`.`media` m ON p.photo_id = m.id
		SET p.photo_id = NULL
		WHERE m.user_id = user_id_del;

		DELETE 
        FROM `vk`.`media` m
		WHERE m.user_id = user_id_del;
    
		DELETE 
        FROM `vk`.`profiles` p
		WHERE p.user_id = user_id_del;
    
		DELETE 
        FROM `vk`.`users` u
		WHERE u.id = user_id_del;
         
	COMMIT;

END;$$

DELIMITER ;

CALL `vk`.`delete_user_proc`(4);

* Написать триггер, который проверяет новое появляющееся сообщество. 
Длина названия сообщества (поле name) должна быть не менее 5 символов. 
Если требование не выполнено, то выбрасывать исключение с пояснением.


USE vk;

DELIMITER $$
$$
CREATE TRIGGER check_new_community_name
BEFORE INSERT
ON communities 
FOR EACH ROW BEGIN
	IF (LENGTH(new.name) < 5) THEN
       SIGNAL SQLSTATE '45000'
	   		SET MESSAGE_TEXT = 'Длина названия сообщества (поле name) должна быть не менее 5 символов';
       INSERT INTO check_new_community_nameTrigger_exception_table VALUES();
   END IF; 
END; 
$$
DELIMITER ;



INSERT INTO vk.communities 
VALUES ('30','test');
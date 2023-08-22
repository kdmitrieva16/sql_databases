Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]

USE `vk`;
CREATE  OR REPLACE VIEW `users_count_of_likes` AS
	SELECT m.user_id, p.birthday, u.firstname, u.lastname, COUNT(l.id) 'count_of_likes'
	FROM likes l
	INNER JOIN media m ON m.id=l.media_id
	INNER JOIN profiles p ON p.user_id=m.user_id
	Inner join users u  on p.user_id=u.id
	group by m.user_id;

Выведите данные, используя написанное представление [SELECT]

select *
from users_count_of_likes  
where user_id=1

Удалите представление [DROP VIEW]

DROP VIEW `vk`.`users_count_of_likes`


* Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей),
 user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.

 SELECT m.user_id, u.email, count(m.media_type_id) news_count
FROM media m
JOIN users u ON m.user_id=u.id
GROUP BY m.user_id
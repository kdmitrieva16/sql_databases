#Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
select distinct firstname 
from users 
order by firstname ASC

# количество мужчин старше 35 лет [COUNT].
select count(*) '>35'
from profiles 
where gender='m'
	and TIMESTAMPDIFF(YEAR, birthday, NOW()) > '35'
# Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
SELECT status, COUNT(*) 'count'
FROM friend_requests
GROUP BY status

* Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT].
SELECT initiator_user_id, COUNT(*) count_requests
FROM friend_requests
GROUP BY initiator_user_id
ORDER BY count_requests DESC  
LIMIT 1;

* Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE].

SELECT id, name
FROM communities
WHERE name LIKE '_____';
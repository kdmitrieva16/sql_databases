# Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.

SELECT u.id , u.firstname, u.lastname, COUNT(community_id) count_community 
FROM users u  
INNER JOIN users_communities uc ON u.id=uc.user_id
GROUP BY u.id
ORDER BY u.id

# Подсчитать количество пользователей в каждом сообществе.
SELECT c.name, COUNT(uc.user_id)
FROM communities c
INNER JOIN users_communities uc on c.id=uc.community_id
GROUP BY c.name

# Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался 
# с выбранным пользователем (написал ему сообщений).
SELECT u.firstname, u.lastname, COUNT(u.id) count_message
FROM messages m 
INNER JOIN users u  ON  m.from_user_id=u.id
WHERE  m.to_user_id=1
GROUP BY  from_user_id
ORDER BY count_message desc LIMIT 1

# Frederick	Kilback	9


# * Подсчитать общее количество лайков, которые получили пользователи младше 18 лет.
SELECT COUNT(l.id) 'Count of likes'
FROM likes l
INNER JOIN media m ON m.id=l.media_id
INNER JOIN profiles p ON p.user_id=m.user_id
WHERE TIMESTAMPDIFF(YEAR, p.birthday, NOW()) < '18';

# * Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT gender, COUNT(l.id) Count_of_likes
FROM likes l
INNER JOIN profiles p ON p.user_id=l.user_id
GROUP BY gender

f	10
m	4
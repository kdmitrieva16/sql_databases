# 2. Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)*/

DROP TABLE IF EXISTS comment;
CREATE TABLE comment (
    id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS comment_to_media;
CREATE TABLE comment_to_media (
    id SERIAL,
    media_id BIGINT UNSIGNED NOT NULL,
    comment_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (comment_id) REFERENCES comment(id)
);
# 3. Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)*/
INSERT INTO `users` 
VALUES ('101','Денис','Гаморов','den.gamorov@yandex.ru','89236001959'),
    ('102','Артём ','Гонторев','art.gon@yandex.ru','89101345672000'),
    ('103','Виктория ','Павлова','pavlova.vika@yandex.ru','89033005005'),
    ('104','Наталья ','Волкова','volkova.nataly@yandex.ru','89333553333'),
    ('105','Елена ','Сазонова','sasozova.elena@mail.ru','89644144444'),
    ('106','Оксана ','Родионова','rodionova.oks@yandex.ru','89555555555'),
    ('107', 'Валерия ','Петрова','petrova.lera@gmail.com','89066666666'),
    ('108','Елена ','Гладышева','glad.elena@yandex.ru','89777777777'),
    ('109','Александр','Πетров','petrov.alex@yandex.ru','89888888888'),
    ('110','Кристина ','Вяткина','vyatkina.kris@yandex.ru','89999999999');

INSERT INTO `profiles` 
VALUES ('101','М','2000-01-11',NULL,NOW(),'Воронеж'),
    ('102','М','2002-02-12',NULL,NOW(),'Сочи'),
    ('103','Ж','2001-03-13',NULL,NOW(),'Калининград'),
    ('104','Ж','2021-04-14',NULL,NOW(),'Норильск'),
    ('105','Ж','2014-05-15',NULL,NOW(),'Кемерово'),
    ('106','Ж','2007-06-16',NULL,NOW(),'Архангельск'),
    ('107','Ж','2005-07-27',NULL,NOW(),'Екатеринбург'),
    ('108','Ж','2010-08-01',NULL,NOW(),'Владивосток'),
    ('109','М','2015-09-05',NULL,NOW(),'Калуга'),
    ('110','Ж','2020-10-07',NULL,NOW(),'Новосибирск');

    


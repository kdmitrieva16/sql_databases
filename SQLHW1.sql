#Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
#Необходимые поля таблицы: product_name (название товара), manufacturer 
#(производитель), product_count (количество), price (цена). Заполните БД произвольными данными.

CREATE TABLE `sql_homeworks`.`mobile_phones` (
  `id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `product_count` INT NULL,
  `price` INT NOT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`));


INSERT INTO `sql_homeworks`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('1', 'iPhone 13 256 Midnight', 'Apple', '2', '75500');
INSERT INTO `sql_homeworks`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('2', 'iPhone 13 Pro 128 Green', 'Apple', '4', '89200');
INSERT INTO `sql_homeworks`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('3', 'iPhone 13 Pro Max 128 Green', 'Apple', '1', '96500');
INSERT INTO `sql_homeworks`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('4', 'Samsung A54 5G 8/256 Lime', 'Samsung', '2', '35500');
INSERT INTO `sql_homeworks`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('5', 'Samsung S22  8/128 Pink', 'Samsung', '3', '52000');
INSERT INTO `sql_homeworks`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('6', 'Samsung S23 Ultra 12/512 Lavender', 'Samsung', '1', '101700');



# Напишите SELECT-запрос, который выводит название товара, производителя и цену для товаров, количество которых превышает 2

select product_name, manufacturer, price from mobile_phones where product_count>2

# Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”

select * from mobile_phones where manufacturer='Samsung'

# С помощью SELECT-запроса с оператором LIKE / REGEXP найти:

* Товары, в которых есть упоминание "Iphone"

select * from mobile_phones where product_name like '%iPhone%'

* Товары, в которых есть упоминание "Samsung"

select * from mobile_phones where product_name like '%Samsung%'

* Товары, в названии которых есть ЦИФРЫ
select * from mobile_phones where product_name like '%[0-9]%'

* Товары, в названии которых есть ЦИФРА "8"
select * from mobile_phones where product_name like '%8%'

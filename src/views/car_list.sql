-- Создание представления "Все машины с категорией"
CREATE OR REPLACE VIEW car_list AS
  SELECT
    car.name as name,
    car_category.name as category,
    car.price
  FROM car
    INNER JOIN car_category ON car_category.id = car.category_id;

# Командный проект по ТБД.
Участники: Кононова Ирина, Петров Олег, Карлов Владимир.

Цель: создание приложения для ведения учета поставок на сети АЗС с применением баз данных.

Описания предметной области: Существует сеть АЗС. Для нормального функционирования она должна наладить поставки продаваемого на ней товара (топлпива). Исходя из этого, понимаем, что существует связь с поставщиками. Получив в свои хранилища товар, они должны найти, куда его сбыть. Так появляется некоторый клиент в данной области. Получается, выделенная предметная область заключается во взаимеодействии между поставщиком, АЗС, клиентом и их атрибутами.

Сущности и их атрибуты:
* Место добычи сырья (название, тип);
* Перерабатывающая организация (название, объем переработка);
* Транспортная компания (название, количество поставок);
* Сеть АЗС (название, адрес, количество колонок, способ оплаты);
* Топливо (тип, октановое число, цена);
* Клиент (оптовый покупатель, розничный покупатель).

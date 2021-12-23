create table MiningOrg (
  mining_ID int NOT NULL primary key, 
  title varchar(200) NOT NULL, 
  address varchar(200), 
  location varchar(200) 
); 

create table FeedstockType (
  FeedstockType_ID int NOT NULL primary key,
  title varchar(200) NOT NULL
); 

create table FeedstockType_MiningOrg ( 
  mining_ID int references MiningOrg ON DELETE SET NULL ON UPDATE CASCADE,
  FeedstockType_ID int references FeedstockType ON DELETE SET NULL ON UPDATE CASCADE,
  primary key(mining_ID, FeedstockType_ID) 
); 

create table TransporterOrg (
  trans_ID int NOT NULL primary key, 
  title varchar(200) NOT NULL, 
  address varchar(200), 
  supply_vol float 
); 

create table Refiner ( 
  refiner_ID int NOT NULL primary key, 
  title varchar(200) NOT NULL, 
  address varchar(200), 
  processing_volume float
); 

create table Transit_Refiner ( 
  mining_ID int references MiningOrg ON DELETE SET NULL ON UPDATE CASCADE,
  trans_ID int references TransporterOrg ON DELETE SET NULL ON UPDATE CASCADE, 
  refiner_ID int references Refiner ON DELETE SET NULL ON UPDATE CASCADE,
  shipment_date date NOT NULL, 
  shipment_vol float NOT NULL, 
  shipment_cost money NOT NULL, 
  _from_ varchar(200) NOT NULL, 
  _to_ varchar(200) NOT NULL, 
  primary key(mining_ID, trans_ID, refiner_ID) 
);   

create table GAS_Station_Net ( 
  net_ID int NOT NULL primary key,
  brand varchar(200) NOT NULL, 
  address varchar(200) 
);

create table Transit_Net ( 
  refiner_ID int references Refiner ON DELETE SET NULL ON UPDATE CASCADE,
  trans_ID int references TransporterOrg ON DELETE SET NULL ON UPDATE CASCADE,
  net_ID int references GAS_Station_Net ON DELETE SET NULL ON UPDATE CASCADE,
  shipment_date date NOT NULL, 
  shipment_vol float NOT NULL, 
  shipment_cost money NOT NULL, 
  _from_ varchar(200) NOT NULL, 
  _to_ varchar(200) NOT NULL, 
  primary key(refiner_ID, trans_ID, net_ID) 
); 


create table GAS_Station ( 
  station_ID int NOT NULL primary key, 
  net_ID int references GAS_Station_Net ON DELETE CASCADE ON UPDATE CASCADE, 
  address varchar(200), 
  has_cafe bool, 
  by_card bool, 
  cash bool, 
  fps bool 
); 

create table FuelType ( 
  type varchar(200) NOT NULL primary key 
);

create table Fuel ( 
  fuel_ID int NOT NULL primary key, 
  station_ID int references GAS_Station ON DELETE SET NULL ON UPDATE CASCADE,
  type varchar(200) references FuelType ON DELETE CASCADE ON UPDATE CASCADE,
  price money, 
  pump_num int
); 

create table Customer ( 
  customer_type varchar(200) NOT NULL primary key, 
  sale float
); 

create table Orders ( 
  order_ID int NOT NULL primary key, 
  station_ID int references GAS_Station ON DELETE SET NULL ON UPDATE CASCADE,
  customer_type varchar(200) references Customer ON DELETE SET NULL ON UPDATE CASCADE,
  fuel_ID int references Fuel  ON DELETE SET NULL ON UPDATE CASCADE,
  total_sum money NOT NULL 
); 



INSERT INTO MiningOrg VALUES (1, 'ООО «ЛУКОЙЛ-Западная Сибирь»', '628486, Тюменская обл., Ханты-Мансийский автономный округ - Югра, г. Когалым, ул. Прибалтийская, д. 20', 'Пякяхинское месторождение');
INSERT INTO MiningOrg VALUES (2, 'ООО «ЛУКОЙЛ-Коми»', '169712, Республика Коми, г. Усинск, ул. Нефтяников, 31', 'Ярегское месторождение');
INSERT INTO MiningOrg VALUES (3, 'ООО "Газпром добыча Краснодар"', '350063, Россия, г. Краснодар, Кубанская Набережная ул., д. 62', 'Печорогородское месторождение');
INSERT INTO MiningOrg VALUES (4, 'ООО «ИНК» (Иркутская нефтяная компания)', 'Россия, 664000, г. Иркутск, пр-кт Большой Литейный, д. 4', 'Ярактинское месторождение');
INSERT INTO MiningOrg VALUES (5, 'АО «Оренбургнефть»', 'Российская Федерация, 461040, Оренбургская область, г. Бузулук, ул. Магистральная, д.2', 'Баклановское меторождение');
INSERT INTO MiningOrg VALUES (6, 'ООО «РН-Юганскнефтегаз»', '628309, Тюменская область, г. Нефтеюганск, ул. Ленина, 26', 'Приразломное месторождение (Роснефть)');
INSERT INTO MiningOrg VALUES (7, 'ООО «РН «Уватнефтегаз»', '625000, г. Тюмень, ул. Ленина 67', 'Усть-Тегусское месторождение');
INSERT INTO MiningOrg VALUES (8, 'АО «Томскнефть» ВНК', 'Россия, 636785, г. Стрежевой Томской области, ул.Буровиков, д. 23', 'Двуреченское месторождение');
INSERT INTO MiningOrg VALUES (9, 'ОАО "Удмуртнефть"', '426057, Удмуртская Республика, город Ижевск, улица Красноармейская, 182', 'Архангельское месторождение');
INSERT INTO MiningOrg VALUES (10, 'ООО «РИТЭК»', '115035, Российская Федерация, Москва, Большая Ордынка, д. 3', 'Западно-Бимское месторождение');
INSERT INTO MiningOrg VALUES (11, 'ООО "ЛУКОЙЛ-ПЕРМЬ"', 'Россия, 614990, г. Пермь, ул. Ленина, 62', 'Жилинское месторождение');
INSERT INTO MiningOrg VALUES (12, 'ООО «Газпромнефть-Хантос»', '628011 Тюменская область, Ханты-Мансийский автономный округ – Югра, г.Ханты-Мансийск, ул.Ленина, 56', 'Приобское месторождение (южная лицензионная территория (ЮЛТ))');
INSERT INTO MiningOrg VALUES (13, 'ООО «РН-Пурнефтегаз»', 'Российская Федерация, 629830, Ямало-Ненецкий автономный округ, г. Губкинский, микрорайон 10, д. 3', 'Восточно-Янгтинское месторождение');
INSERT INTO MiningOrg VALUES (14, 'ООО "Газпром добыча Надым"', 'ЯНАО, г. Надым, ул. Пионерская, д. 14', 'Медвежье месторождение');
INSERT INTO MiningOrg VALUES (15, 'ООО "УДС нефть"', '426011, Удмуртская Республика, г. Ижевск, ул. Пушкинская, д. 277', 'Мальцевское месторождение');
INSERT INTO MiningOrg VALUES (16, 'ООО «Газпромнефть-Оренбург»', '460024, г. Оренбург, ул. Краснознаменная 56/1', 'Царичанское месторождение');
INSERT INTO MiningOrg VALUES (17, 'ООО «НОВАТЭК-ТАРКОСАЛЕНЕФТЕГАЗ»', 'Ямало-Ненецкий АО, г.Тарко-Сале, ул.Тарасова, д.28, 629850', 'Ханчейское месторождение');
INSERT INTO MiningOrg VALUES (18, 'ООО "Газпром добыча Ямбург"', 'ул. Геологоразведчиков, д.9, г. Новый Уренгой, 629306, ЯНАО, Российская Федерация', 'Заполярное месторождение');
INSERT INTO MiningOrg VALUES (19, 'ООО "СК "РУСВЬЕТПЕТРО"', 'Российская Федерация, 127422, г. Москва, Дмитровский проезд, д. 10, стр. 1', 'Сюрхаратинское месторождение');
INSERT INTO MiningOrg VALUES (20, 'АО «РОСПАН ИНТЕРНЕШНЛ»', '629306, Ямало-Ненецкий автономный округ, г. Новый Уренгой, ул. Геологоразведчиков, дом 16 «В»', 'Восточно-Уренгойское месторождение');

INSERT INTO FeedstockType VALUES (1, 'Нефть');
INSERT INTO FeedstockType VALUES (2, 'Газ');

INSERT INTO FeedstockType_MiningOrg VALUES (1, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (2, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (3, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (4, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (5, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (6, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (7, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (8, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (9, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (10, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (11, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (12, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (13, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (14, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (15, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (16, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (17, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (18, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (19, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (20, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (1, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (2, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (3, 1);
INSERT INTO FeedstockType_MiningOrg VALUES (4, 2);
INSERT INTO FeedstockType_MiningOrg VALUES (5, 2);

INSERT INTO Refiner VALUES (1, 'АО «Новокуйбышевский нефтеперерабатывающий завод»', '446007, Самарская обл., г. Новокуйбышевск, ул. Осипенко, д. 12, стр. 1', 7.9);
INSERT INTO Refiner VALUES (2, 'ОАО «ТАИФ-НК»', 'Россия, 423570, Республика Татарстан, г. Нижнекамск, ОПС-11, а/я - 20', 8.3);
INSERT INTO Refiner VALUES (3, 'АО «РНПК»', '390011, Рязанская область, г. Рязань, ул. Южный промузел, д. 8', 17.1);
INSERT INTO Refiner VALUES (4, 'АО "Ачинский нефтеперерабатывающий завод Восточной нефтяной компании" (АО "АНПЗ ВНК")', 'Россия, 410022, Красноярский край, Большеулуйский район, промзона НПЗ ОАО "АНПЗ ВНК.', 7.5);
INSERT INTO Refiner VALUES (5, 'ООО «РН-Комсомольский НПЗ»', '681007, Хабаровский край, г. Комсомольск-на-Амуре, ул. Ленинградская, д. 115', 8.3);
INSERT INTO Refiner VALUES (6, 'ООО «Газпром нефтехим Салават»', 'Россия, 453256, Республика Башкортостан, г. Салават, ул. Молодогвардейцев, 30', 10.0);
INSERT INTO Refiner VALUES (7, 'АО «ГАЗПРОМНЕФТЬ-ОНПЗ»', '644040, Россия, г. Омск, пр. Губкина, 1', 20.5);
INSERT INTO Refiner VALUES (8, 'ООО «ЗАПСИБНЕФТЕХИМ»', '626150, Россия, Тюменская обл., г. Тобольск, промзона\xa0', 11.0);
INSERT INTO Refiner VALUES (9, 'АО «ГАЗПРОМНЕФТЬ-МНПЗ»', '109429, Москва, Капотня, 2 квартал, д. 1, корп. 3', 11.0);
INSERT INTO Refiner VALUES (10, 'ООО «РН-Туапсинский НПЗ»', '352800 Краснодарский край, г. Туапсе, ул. Сочинская, 1', 12.0);
INSERT INTO Refiner VALUES (11, 'АО «Сызранский НПЗ»', 'Россия, 446009, Самарская обл., г. Сызрань, ул. Астраханская, д. 1', 8.5);
INSERT INTO Refiner VALUES (12, 'АО «Куйбышевский НПЗ»', '443004, Самарская обл., г. Самара, ул. Грозненская, д. 25', 7.0);

INSERT INTO TransporterOrg VALUES (1, 'ООО «Уральская Логистическая Группа»', '620075, Россия, г. Екатеринбург, ул. Мамина-Сибиряка 101, офис 455', 3000.0);
INSERT INTO TransporterOrg VALUES (2, 'ООО "Газпром трансгаз Екатеринбург"', '620075, г. Екатеринбург, ул. Клары Цеткин, д. 14', 500.0);
INSERT INTO TransporterOrg VALUES (3, 'ПАО «Транснефть»', '123112, г. Москва, Пресненская набережная, д. 4, стр. 2', 18000.0);
INSERT INTO TransporterOrg VALUES (4, 'АО «Транснефть - Урал»', '450008, Российская Федерация, Республика Башкортостан, г. Уфа, ул. Крупской, д. 10', 1200.0);
INSERT INTO TransporterOrg VALUES (5, 'АО «Транснефть – Верхняя Волга»', '603006, Россия, г. Нижний Новгород, пер. Гранитный, 4/1', 800);
INSERT INTO TransporterOrg VALUES (6, 'АО «Черномортранснефть»', '353911, Россия, Краснодарский край, г. Новороссийск, Шесхарис', 1000.0);
INSERT INTO TransporterOrg VALUES (7, 'АО «Транснефть – Прикамье»', '420081, Республика Татарстан г.Казань, ул.П.Лумумбы д.20, корп 1', 1100.0);
INSERT INTO TransporterOrg VALUES (8, 'ООО «Транснефть – Восток»', '665734, Россия, Иркутcкая обл., г.Братск, ж.р.Энергетик, ул.Олимпийская, 14', 600.0);

INSERT INTO Transit_Refiner VALUES (9, 4, 11, '2020-11-01', 220, 12.5, 'Россия, 636785, г. Стрежевой Томской области, ул.Буровиков, д. 23', 'Россия, 446009, Самарская обл., г. Сызрань, ул. Астраханская, д. 1');
INSERT INTO Transit_Refiner VALUES (2, 2, 10, '2019-10-12', 100, 6.0, '169712, Республика Коми, г. Усинск, ул. Нефтяников, 31', '352800 Краснодарский край, г. Туапсе, ул. Сочинская, 1');
INSERT INTO Transit_Refiner VALUES (8, 3, 5, '2019-05-23', 50, 3.0, 'Россия, 636785, г. Стрежевой Томской области, ул.Буровиков, д. 23', '681007, Хабаровский край, г. Комсомольск-на-Амуре, ул. Ленинградская, д. 115');
INSERT INTO Transit_Refiner VALUES (1, 6, 4, '2021-03-29', 130, 7.5, '628486, Тюменская обл., Ханты-Мансийский автономный округ - Югра, г. Когалым, ул. Прибалтийская, д. 20', 'Россия, 410022, Красноярский край, Большеулуйский район, промзона НПЗ ОАО "АНПЗ ВНК.');
INSERT INTO Transit_Refiner VALUES (4, 5, 3, '2020-05-11', 55, 3.4, 'Россия, 664000, г. Иркутск, пр-кт Большой Литейный, д. 4', '390011, Рязанская область, г. Рязань, ул. Южный промузел, д. 8');
INSERT INTO Transit_Refiner VALUES (14, 7, 12, '2019-09-09', 300, 15.2, 'ЯНАО, г. Надым, ул. Пионерская, д. 14', '443004, Самарская обл., г. Самара, ул. Грозненская, д. 25');
INSERT INTO Transit_Refiner VALUES (6, 1, 9, '2021-07-19', 120, 8.2, '628309, Тюменская область, г. Нефтеюганск, ул. Ленина, 26', '109429, Москва, Капотня, 2 квартал, д. 1, корп. 3');
INSERT INTO Transit_Refiner VALUES (17, 8, 7, '2019-04-05', 90, 5.5, 'Ямало-Ненецкий АО, г.Тарко-Сале, ул.Тарасова, д.28, 629850', '644040, Россия, г. Омск, пр. Губкина, 1');

INSERT INTO GAS_Station_Net VALUES (1, 'ПАО "ЛУКОЙЛ"', '101000, г Москва, б-р Сретенский, д.11');
INSERT INTO GAS_Station_Net VALUES (2, 'ПАО «Газпром нефть»', 'ул. Почтамтская, д. 3-5, Санкт-Петербург, Россия, 190000');
INSERT INTO GAS_Station_Net VALUES (3, 'ООО "Нефтьмагистраль"', '142191, г. Москва, г. Троицк, пл Академическая, 4, эт. 18');
INSERT INTO GAS_Station_Net VALUES (4, 'ПАО "НК "Роснефть"', '115035, Москва, Софийская набережная, 26/1');
INSERT INTO GAS_Station_Net VALUES (5, 'ПАО «Татнефть»', '423450, Россия, Республика Татарстан, г. Альметьевск, ул. Ленина, д. 75. 4.');

INSERT INTO Transit_Net VALUES (10, 2, 1, '2020-12-21', 10, 0.7, '352800 Краснодарский край, г. Туапсе, ул. Сочинская, 1', 'Россия, Красноармейский район, станица Полтавская, Центральная улица');
INSERT INTO Transit_Net VALUES (3, 4, 1, '2019-01-10', 12, 1.0, '390011, Рязанская область, г. Рязань, ул. Южный промузел, д. 8', 'Куйбышевское ш., 53, Рязань, Россия');
INSERT INTO Transit_Net VALUES (4, 5, 1, '2021-02-01', 8, 0.6, 'Россия, 410022, Красноярский край, Большеулуйский район, промзона НПЗ ОАО "АНПЗ ВНК.', 'Кемеровская обл., автотрасса Ленинск-Кузнецкий-Прокопьевск-Новокузнецк, 5 км (справа)');
INSERT INTO Transit_Net VALUES (4, 6, 2, '2021-05-15', 20, 2.0, 'Россия, 410022, Красноярский край, Большеулуйский район, промзона НПЗ ОАО "АНПЗ ВНК.', 'ул. Старый Скит, 1/2, Дивногорск, Россия');
INSERT INTO Transit_Net VALUES (5, 5, 4, '2019-11-05', 15, 0.9, '681007, Хабаровский край, г. Комсомольск-на-Амуре, ул. Ленинградская, д. 115', 'Комсомольск-на-Амуре, Хабаровский край, Россия, 681017');
INSERT INTO Transit_Net VALUES (1, 3, 4, '2019-09-25', 50, 3.0, '446007, Самарская обл., г. Новокуйбышевск, ул. Осипенко, д. 12, стр. 1', 'Самарская область, Безенчукский район, поселок городского типа Осинки, Роснефть АЗС №101');
INSERT INTO Transit_Net VALUES (11, 8, 4, '2021-06-18', 22, 2.1, 'Россия, 446009, Самарская обл., г. Сызрань, ул. Астраханская, д. 1', 'Россия, Самарская область, городской округ Кинель, посёлок городского типа Алексеевка (справа)');
INSERT INTO Transit_Net VALUES (12, 7, 5, '2020-07-23', 15, 1.0, '443004, Самарская обл., г. Самара, ул. Грозненская, д. 25', 'Россия, Самарская область, Красноярский район, Р-241, 65-й километр, 241');

INSERT INTO GAS_Station VALUES (1, 1, 'Россия, Красноармейский район, станица Полтавская, Центральная улица', 1, 1, 1, 1);
INSERT INTO GAS_Station VALUES (2, 1, 'Куйбышевское ш., 53, Рязань, Россия', 0, 1, 0, 0);
INSERT INTO GAS_Station VALUES (3, 1, 'Кемеровская обл., автотрасса Ленинск-Кузнецкий-Прокопьевск-Новокузнецк, 5 км (справа)', 1, 0, 1, 1);
INSERT INTO GAS_Station VALUES (4, 2, 'ул. Старый Скит, 1/2, Дивногорск, Россия', 1, 1, 1, 0);
INSERT INTO GAS_Station VALUES (5, 4, 'Комсомольск-на-Амуре, Хабаровский край, Россия, 681017', 1, 0, 1, 0);
INSERT INTO GAS_Station VALUES (6, 4, 'Самарская область, Безенчукский район, поселок городского типа Осинки, Роснефть АЗС №101', 1, 1, 1, 0);
INSERT INTO GAS_Station VALUES (7, 4, 'Россия, Самарская область, городской округ Кинель, посёлок городского типа Алексеевка (справа)', 1, 1, 1, 0);
INSERT INTO GAS_Station VALUES (8, 5, 'Россия, Самарская область, Красноярский район, Р-241, 65-й километр, 241', 1, 0, 1, 0);

INSERT INTO FuelType VALUES ('АИ-100');
INSERT INTO FuelType VALUES ('АИ-80');
INSERT INTO FuelType VALUES ('АИ-92');
INSERT INTO FuelType VALUES ('АИ-95');
INSERT INTO FuelType VALUES ('АИ-97');
INSERT INTO FuelType VALUES ('АИ-98');
INSERT INTO FuelType VALUES ('Газ');
INSERT INTO FuelType VALUES ('ДТ');

INSERT INTO Fuel VALUES (1, 1, 'АИ-100', 54.2, 1);
INSERT INTO Fuel VALUES (2, 1, 'АИ-80', 44.0, 2);
INSERT INTO Fuel VALUES (3, 1, 'АИ-92', 46.8, 3);
INSERT INTO Fuel VALUES (4, 1, 'АИ-95', 47.2, 4);
INSERT INTO Fuel VALUES (5, 1, 'АИ-97', 49.0, 5);
INSERT INTO Fuel VALUES (6, 1, 'АИ-98', 49.5, 6);
INSERT INTO Fuel VALUES (7, 1, 'Газ', 27.5, 7);
INSERT INTO Fuel VALUES (8, 1, 'ДТ', 52.7, 8);
INSERT INTO Fuel VALUES (9, 2, 'АИ-92', 46.8, 1);
INSERT INTO Fuel VALUES (10, 2, 'АИ-95', 47.1, 2);
INSERT INTO Fuel VALUES (11, 2, 'АИ-97', 49.0, 3);
INSERT INTO Fuel VALUES (12, 3, 'Газ', 27.5, 1);
INSERT INTO Fuel VALUES (13, 3, 'ДТ', 52.7, 2);
INSERT INTO Fuel VALUES (14, 4, 'ДТ', 52.5, 1);
INSERT INTO Fuel VALUES (15, 4, 'АИ-95', 47.1, 2);
INSERT INTO Fuel VALUES (16, 4, 'АИ-97', 49.5, 3);
INSERT INTO Fuel VALUES (17, 4, 'АИ-92', 46.8, 4);
INSERT INTO Fuel VALUES (18, 5, 'АИ-95', 47.2, 1);
INSERT INTO Fuel VALUES (19, 5, 'АИ-97', 49.0, 2);
INSERT INTO Fuel VALUES (20, 6, 'АИ-92', 46.8, 1);
INSERT INTO Fuel VALUES (21, 6, 'АИ-95', 47.1, 2);
INSERT INTO Fuel VALUES (22, 7, 'АИ-97', 48.1, 1);

INSERT INTO Customer VALUES ('Категория 1', 0.01);
INSERT INTO Customer VALUES ('Категория 2', 0.02);
INSERT INTO Customer VALUES ('Категория 3', 0.05);
INSERT INTO Customer VALUES ('Категория 4', 0.1);

INSERT INTO Orders VALUES (1, 1, 'Категория 1', 1, 1200);
INSERT INTO Orders VALUES (2, 1, 'Категория 1', 2, 900);
INSERT INTO Orders VALUES (3, 1, 'Категория 1', 3, 3800);
INSERT INTO Orders VALUES (4, 2, 'Категория 2', 4, 3000);
INSERT INTO Orders VALUES (5, 4, 'Категория 2', 5, 2500);
INSERT INTO Orders VALUES (6, 4, 'Категория 3', 6, 1400);
INSERT INTO Orders VALUES (7, 4, 'Категория 4', 7, 1900);
INSERT INTO Orders VALUES (8, 5, 'Категория 4', 8, 2400);
INSERT INTO Orders VALUES (9, 6, 'Категория 1', 9, 500);
INSERT INTO Orders VALUES (10, 7, 'Категория 1', 10, 750);
INSERT INTO Orders VALUES (11, 8, 'Категория 1', 11, 1000);
INSERT INTO Orders VALUES (12, 5, 'Категория 1', 12, 2300);
INSERT INTO Orders VALUES (13, 5, 'Категория 1', 13, 1900);
INSERT INTO Orders VALUES (14, 5, 'Категория 1', 14, 3200);
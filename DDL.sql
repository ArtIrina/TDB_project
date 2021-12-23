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

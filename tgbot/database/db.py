import sqlite3 as sql
from config import BASE_FILE

class FuelControlDB:

    def __init__(self):
        self.base = sql.connect(BASE_FILE)
        self.cursor = self.base.cursor()
        if self.base:
            print("База данных успешно подключена.")

    def output_stations(self):
        """Выводить список точек АЗС (адрес, к какой сети АЗС принадлежит точка, 
        есть ли кафе, возможен ли безналичный расчет, есть ли система быстрых платежей)"""
        result = self.cursor.execute(
            "SELECT GS.address, GSN.brand, GS.has_cafe, GS.by_card, GS.fps FROM GAS_Station AS GS \
                JOIN GAS_Station_Net AS GSN ON (GS.net_id = GSN.net_id)"
        )
        return result.fetchall()
    
    def output_minings(self):
        """Выводить называние и адрес добывающей компании"""
        result = self.cursor.execute("SELECT title, address FROM MiningOrg")
        return result.fetchall()
    
    def output_refiners(self):
        """Выводить называние и адрес перерабатывающей компании"""
        result = self.cursor.execute("SELECT title, address FROM Refiner")
        return result.fetchall()
    
    def output_feedstocks_oil(self):
        """Выводить месторождение нефти, локацию, добывающую компанию"""
        result = self.cursor.execute("SELECT MO.location, MO.title FROM MiningOrg AS MO \
                                JOIN FeedstockType_MiningOrg AS FSMO ON (MO.mining_ID = FSMO.mining_ID) \
                                JOIN FeedstockType AS FS ON (FS.FeedstockType_ID = FSMO.FeedstockType_ID) \
                                WHERE FS.title = \"Нефть\""
        )
        return result.fetchall()
    
    def output_feedstocks_gas(self):
        """Выводить месторождение нефти, локацию, добывающую компанию"""
        result = self.cursor.execute("SELECT MO.location, MO.title FROM MiningOrg AS MO \
                                JOIN FeedstockType_MiningOrg AS FSMO ON (MO.mining_ID = FSMO.mining_ID) \
                                JOIN FeedstockType AS FS ON (FS.FeedstockType_ID = FSMO.FeedstockType_ID) \
                                WHERE FS.title = \"Газ\""
        )
        return result.fetchall()
    
    def output_stations(self):
        """Выводить список сетей АЗС (название сети, адрес, число точек)"""
        result = self.cursor.execute(
            "SELECT GS.address, GSN.brand, GS.has_cafe, GS.by_card, GS.fps FROM GAS_Station AS GS \
                JOIN GAS_Station_Net AS GSN ON (GS.net_ID = GSN.net_ID)"
        )
        return result.fetchall()
    
    
    def output_nets(self):
        """Выводить список сетей АЗС (название сети, адрес, число точек)"""
        result = self.cursor.execute(
            "SELECT GSN.brand, GSN.address, count(GS.station_ID) FROM GAS_Station_Net AS GSN \
                JOIN GAS_Station AS GS ON (GS.net_ID = GSN.net_ID) \
                GROUP BY (GSN.net_ID)"
        )
        return result.fetchall()
    
    def output_transfer_nets(self):
        """Выводить список поставок от переработчика к сети АЗС"""
        result = self.cursor.execute(
            "SELECT R.title, TO_.title, GSN.brand, TN.shipment_vol, TN.shipment_cost FROM Transit_Net AS TN \
                JOIN Refiner AS R ON (TN.refiner_ID = R.refiner_ID) \
                JOIN TransporterOrg AS TO_ ON (TN.trans_ID = TO_.trans_ID) \
                JOIN GAS_Station_Net AS GSN ON (TN.net_ID = GSN.net_ID)"
        )
        return result.fetchall()
    
    def output_transfer_refiner(self):
        """Выводить список поставок от доб. орг. к сети переработчику"""
        result = self.cursor.execute(
            "SELECT MO.title, TO_.title, R.title, TR.shipment_vol, TR.shipment_cost FROM Transit_Refiner AS TR \
                JOIN MiningOrg AS MO ON (TR.mining_ID = MO.mining_ID) \
                JOIN Refiner AS R ON (TR.refiner_ID = R.refiner_ID) \
                JOIN TransporterOrg AS TO_ ON (TR.trans_ID = TO_.trans_ID)"
        )
        return result.fetchall()
    
    def output_min_prices(self):
        """Выводить минимальныецены на каждый тип топлива по всем точкам АЗС"""
        result = self.cursor.execute("SELECT DISTINCT F.type, min(F.price) AS price FROM Fuel AS F \
                JOIN GAS_Station AS GS ON (GS.station_ID = F.station_ID) \
                GROUP BY F.type ORDER BY min(F.price) DESC")

        return result.fetchall()
    
    def output_max_prices(self):
        """Выводить максимальные цены на каждый тип топлива по всем точкам АЗС"""
        result = self.cursor.execute("SELECT DISTINCT F.type, max(F.price) AS price FROM Fuel AS F \
                JOIN GAS_Station AS GS ON (GS.station_ID = F.station_ID) \
                GROUP BY F.type ORDER BY max(F.price) DESC")

        return result.fetchall()
    
    def output_avg_prices(self):
        """Выводить средние цены на каждый тип топлива по всем точкам АЗС"""
        result = self.cursor.execute("SELECT DISTINCT F.type, avg(F.price) AS price FROM Fuel AS F \
                JOIN GAS_Station AS GS ON (GS.station_ID = F.station_ID) \
                GROUP BY F.type ORDER BY avg(F.price) DESC")

        return result.fetchall()
    
    def close(self):
        """Закрываем соединение с БД"""
        self.base.close()

from aiogram.types import ReplyKeyboardMarkup, KeyboardButton

b1 = KeyboardButton("/Добывающие_компании")
b2 = KeyboardButton("/Цены")
b3 = KeyboardButton("/АЗС")
b4 = KeyboardButton("/Перерабатывающие_компании")
b_next = KeyboardButton("/Далее")
b_prev = KeyboardButton("/Назад")

keyb_clients = []
keyb_clients.append(ReplyKeyboardMarkup(resize_keyboard=True))
keyb_clients[0].add(b1).add(b4).add(b2).insert(b3)
keyb_clients[0].add(b_prev).insert(b_next)

b5 = KeyboardButton("/Месторождения_нефти")
b6 = KeyboardButton("/Месторождения_газа")
b7 = KeyboardButton("/Сети_АЗС")
keyb_clients.append(ReplyKeyboardMarkup(resize_keyboard=True))
keyb_clients[1].add(b5).add(b6).add(b7)
keyb_clients[1].add(b_prev).insert(b_next)


b8 = KeyboardButton("/Поставки_сети")
b9 = KeyboardButton("/Поставки_заводу")
keyb_clients.append(ReplyKeyboardMarkup(resize_keyboard=True))
keyb_clients[2].add(b8).add(b9)
keyb_clients[2].add(b_prev).insert(b_next)

class Keyboards:
    def __init__(self, kbs):
        self.keyboards = kbs
        self.ind = 0
        self.keyb_client = kbs[0]
        self.len = len(kbs)
    
    def base(self):
        self.ind = 0
        self.keyb_client = self.keyboards[0]
        return self.keyb_client
        
    def prev_keys(self):
        if self.ind <= 0:
            return "NOTOK"
        else:
            self.ind -= 1
            self.keyb_client = self.keyboards[self.ind]
            return "OK"
        
    def next_keys(self):
        if self.ind >= self.len - 1:
            return "NOTOK"
        else:
            self.ind += 1
            self.keyb_client = self.keyboards[self.ind]
            return "OK"

keyboards = Keyboards(keyb_clients)

# networkx lib -- check 
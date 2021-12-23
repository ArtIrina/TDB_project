from aiogram import types, Dispatcher
from create_bot import dp, bot
from keyboards import keyboards
# import re
from create_bot import FCBase

async def start(message: types.Message):
    await message.answer("Добро пожаловать!")
    await message.answer("Для начала работы выберите необходимую команду.", reply_markup=keyboards.base())
    await message.answer("Меню 1")
    
    
async def mining_orgs(message: types.Message):
    records = FCBase.output_minings()

    if (len(records)):
        await message.answer("Список добывающих компаний:")
        answer = ""
        for r in records:
            answer += "Название: " + str(r[0]) + "\n"
            answer += "Юр. адрес: " + str(r[1]) + "\n"
            answer += "\n"

        await message.answer(answer)
    else:
        await message.answer("Компаний не обнаружено!")
        

async def refiner_orgs(message: types.Message):
    records = FCBase.output_refiners()

    if (len(records)):
        await message.answer("Список перерабатывающих компаний:")
        answer = ""
        for r in records:
            answer += "Название: " + str(r[0]) + "\n"
            answer += "Юр. адрес: " + str(r[1]) + "\n"
            answer += "\n"

        await message.answer(answer)
    else:
        await message.answer("Компаний не обнаружено!")
        
        
async def feedstocks_oil(message: types.Message):
    records = FCBase.output_feedstocks_oil()

    if (len(records)):
        await message.answer("Список месторождений нефти:")
        answer = ""
        for r in records:
            answer += "Название: " + str(r[0]) + "\n"
            answer += "Добывающая компания: " + str(r[1]) + "\n"
            answer += "\n"

        await message.answer(answer)
    else:
        await message.answer("Месторождений не обнаружено!")
        

async def feedstocks_gas(message: types.Message):
    records = FCBase.output_feedstocks_oil()

    if (len(records)):
        await message.answer("Список месторождений газа:")
        answer = ""
        for r in records:
            answer += "Название: " + str(r[0]) + "\n"
            answer += "Добывающая компания: " + str(r[1]) + "\n"
            answer += "\n"

        await message.answer(answer)
    else:
        await message.answer("Месторождений не обнаружено!")
        
        
async def get_stations(message: types.Message):
    records = FCBase.output_stations()
    
    if (len(records)):
        await message.answer("Список точек АЗС:")
        answer = ""
        for r in records:
            answer += "Адрес: " + str(r[0]) + "\n"
            answer += "Сеть: " + str(r[1]) + "\n"
            answer += "Кафе: " + ("Да" if not r[2] else "Нет") + "\n"
            answer += "Безналичный расчет: " + ("Да" if not r[3] else "Нет") + "\n"
            answer += "Оплата СБП: " + ("Да" if not r[4] else "Нет") + "\n"
            answer += "\n"

        await message.answer(answer)
    else:
        await message.answer("Точек АЗС не обнаружено!")
        

async def get_transfers_net(message: types.Message):
    records = FCBase.output_transfer_nets()
    
    if (len(records)):
        await message.answer("Список поставок от переработчика сети АЗС:")
        answer = ""
        for r in records:
            answer += "Поставляет: " + str(r[0]) + "\n"
            answer += "Перевозит: " + str(r[1]) + "\n"
            answer += "Принимает: " + str(r[2]) + "\n"
            answer += "По объему: " + str(r[3]) + " млн тонн\n"
            answer += "По цене: " + str(r[4]) + " млн рублей\n"
            answer += "\n"

        await message.answer(answer)
    else:
        await message.answer("Поставок не обнаружено!")      
        
        
async def get_transfers_refiner(message: types.Message):
    records = FCBase.output_transfer_refiner()
    
    if (len(records)):
        await message.answer("Список поставок от доб. орг. переработчику:")
        answer = ""
        for r in records:
            answer += "Поставляет: " + str(r[0]) + "\n"
            answer += "Перевозит: " + str(r[1]) + "\n"
            answer += "Принимает: " + str(r[2]) + "\n"
            answer += "По объему: " + str(r[3]) + " млн тонн\n"
            answer += "По цене: " + str(r[4]) + " млн рублей\n"
            answer += "\n"

        await message.answer(answer)
    else:
        await message.answer("Поставок не обнаружено!")  

        
        
async def get_nets(message: types.Message):
    records = FCBase.output_nets()
    
    if (len(records)):
        await message.answer("Список сетей АЗС:")
        answer = ""
        for r in records:
            answer += "Название: " + str(r[0]) + "\n"
            answer += "Юр. адрес: " + str(r[1]) + "\n"
            answer += "Число точек: " + str(r[2]) + "\n"
            answer += "\n"

        await message.answer(answer)
    else:
        await message.answer("Сетей АЗС не обнаружено, либо у них нет точек!")
        
        
async def get_prices(message: types.Message):
    records = FCBase.output_min_prices()
    
    await message.answer("Статистика цен на топливо по всем точкам:")
    
    if (len(records)):
        answer = "Тип\t Минимальная цена (руб.)\n"
        for r in records:
            answer += str(r[0]) + "\t " +  str(r[1]) + "\n"

        await message.answer(answer)
    else:
        await message.answer("Не удалось посчитать статистику!")
        
    records = FCBase.output_max_prices()    
        
    if (len(records)):
        answer = "Тип\t Максимальная цена (руб.)\n"
        for r in records:
            answer += str(r[0]) + "\t " +  str(r[1]) + "\n"

        await message.answer(answer)
    else:
        await message.answer("Не удалось посчитать статистику!")
        
    records = FCBase.output_avg_prices()     
        
    if (len(records)):
        answer = "Тип\t Средняя цена (руб.)\n"
        for r in records:
            answer += str(r[0]) + "\t " +  str(r[1]) + "\n"

        await message.answer(answer)
    else:
        await message.answer("Не удалось посчитать статистику!")
    
    
async def next_menu(message: types.Message):
    ok = keyboards.next_keys()
    if ok == "OK":
        text = "Меню {}".format(keyboards.ind + 1)
        await message.answer(text, reply_markup=keyboards.keyb_client)
    else:
        await message.answer("Вы находитесь в последнем меню!")
    
async def prev_menu(message: types.Message):
    ok = keyboards.prev_keys()
    if ok == "OK":
        text = "Меню {}".format(keyboards.ind + 1)
        await message.answer(text, reply_markup=keyboards.keyb_client)
    else:
        await message.answer("Вы уже находитесь в начальном меню!")
    

def register_handler_clt(dp : Dispatcher):
    dp.register_message_handler(start, commands=["start"])
    dp.register_message_handler(mining_orgs, commands=["Добывающие_компании"])
    dp.register_message_handler(refiner_orgs, commands=["Перерабатывающие_компании"])
    dp.register_message_handler(get_prices, commands=["Цены"])
    dp.register_message_handler(get_stations, commands=["АЗС"])
    dp.register_message_handler(feedstocks_oil, commands=["Месторождения_нефти"])
    dp.register_message_handler(feedstocks_gas, commands=["Месторождения_газа"])
    dp.register_message_handler(get_stations, commands=["АЗС"])
    dp.register_message_handler(get_nets, commands=["Сети_АЗС"])
    dp.register_message_handler(get_transfers_refiner, commands=["Поставки_заводу"])
    dp.register_message_handler(get_transfers_net, commands=["Поставки_сети"])
    dp.register_message_handler(next_menu, commands=["Далее"])
    dp.register_message_handler(prev_menu, commands=["Назад"])

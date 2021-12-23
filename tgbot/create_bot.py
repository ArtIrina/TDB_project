from aiogram import Bot
from aiogram.dispatcher import Dispatcher
from config import BOT_TOKEN
from database.db import FuelControlDB

bot = Bot(token=BOT_TOKEN)
dp = Dispatcher(bot)
FCBase = FuelControlDB()

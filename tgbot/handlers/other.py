from aiogram import types
from create_bot import dp, Dispatcher

async def echo_send(message : types.Message):
    await message.answer("Неизвестная команда!")

def register_handler_oth(dp : Dispatcher):
    dp.register_message_handler(echo_send)
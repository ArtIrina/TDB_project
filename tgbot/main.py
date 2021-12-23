from create_bot import dp
from aiogram.utils import executor
from handlers import client, other

async def on_startup(_):
    print("Executing...")
    
client.register_handler_clt(dp)
other.register_handler_oth(dp)
    
executor.start_polling(dp, skip_updates=True, on_startup=on_startup)

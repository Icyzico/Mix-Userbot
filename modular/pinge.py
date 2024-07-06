################################################################
"""
 Mix-Userbot Open Source . Maintained ? Yes Oh No Oh Yes Ngentot
 
 @ CREDIT : NAN-DEV
"""
################################################################
from datetime import datetime
from random import randint
from time import time

from pyrogram.raw.functions import Ping

from Mix import *
from Mix.core.waktu import get_time, start_time

__modles__ = "Ping"
__help__ = get_cgr("help_ping")


"""
#@ky.ubot("ping")
#@ky.devs("mping")
async def _(c: nlx, m):
    em = Emojik()
    em.initialize()
    start = datetime.now()
    # ping_id = int(time() * 1000)
    ping_id = randint(1, 1000)
    await c.invoke(Ping(ping_id=ping_id))
    end = datetime.now()
    delta_ping = round((end - start).microseconds / 1000, 1)
    upnya = await get_time((time() - start_time))
    _ping = cgr("ping_1").format(
        em.ping, str(delta_ping).replace(".", ","), em.pong, upnya
    )
    try:
        await m.reply(_ping)
    except 
"""


from datetime import datetime
from random import randint
from time import time
from pyrogram.raw.functions import Ping
from Mix import *
from Mix.core.waktu import get_time, start_time


async def plongo(c: nlx, m):
    try:
        em = Emojik()
        em.initialize()
        start = datetime.now()
        ping_id = randint(1, 1000000)
        await c.invoke(Ping(ping_id=ping_id))
        end = datetime.now()
        delta_ping = round((end - start).microseconds / 1000, 1)
        upnya = await get_time((time() - start_time))
        _ping = cgr("ping_1").format(
            em.ping, str(delta_ping).replace(".", ","), em.pong, upnya
        )
        await m.reply(_ping)
    except RandomIdDuplicate:
        await plongo(c, m)
    except Exception as e:
        print(f"Error saat mengirim ping: {e}")


@ky.ubot("ping")
@ky.devs("mping")
async def _(c: nlx, m):
    await plongo(c, m)


################################################################
"""
 Mix-Userbot Open Source . Maintained ? Yes Oh No Oh Yes Ngentot
 
 @ CREDIT : NAN-DEV
"""
################################################################
from datetime import datetime
from time import time

from pyrogram.raw.functions import Ping

from Mix import *
from Mix.core.waktu import get_time, start_time

__modles__ = "Ping"
__help__ = get_cgr("help_ping")


@ky.ubot("ping")
@ky.devs("mping")
async def _(c: nlx, m):
    em = Emojik()
    em.initialize()
    start = datetime.now()
    ping_id = int(time() * 1000)
    await c.invoke(Ping(ping_id=ping_id))
    end = datetime.now()
    delta_ping = round((end - start).microseconds / 1000, 1)
    upnya = await get_time((time() - start_time))
    _ping = cgr("ping_1").format(
        em.ping, str(delta_ping).replace(".", ","), em.pong, upnya
    )
    await m.reply(_ping)

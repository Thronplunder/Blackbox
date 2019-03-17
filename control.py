#!/usr/bin/python3
import skywriter
import signal
from pythonosc import udp_client
from pythonosc import osc_message_builder

ip = "127.0.0.1"
oscPort = 57120
client = udp_client.UDPClient(ip, oscPort)

@skywriter.move()
def move(x, y, z):
    #print(x, y, z)
    msg = osc_message_builder.OscMessageBuilder("/position")
    msg.add_arg(x)
    msg.add_arg(y)
    msg.add_arg(z)
    msg = msg.build()
    #print("trying to send message")
    client.send(msg)    
    #print("message sent")

@skywriter.airwheel()
def airwheel(delta):
    msg = osc_message_builder.OscMessageBuilder("/airwheel")
    msg.add_arg(delta)
    msg = msg.build()
    print(delta)
    client.send(msg)
signal.pause()

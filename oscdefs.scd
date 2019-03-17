OSCdef(\position, {
	|msg, time, addr, recvPort|
    var triggerFreq, position, grainSize;
    x = msg[1];
    y = msg[2];
    z = msg[3];
    triggerFreq = y.linlin(0,1, 100, 200);
    position = x.linlin(0,1, 0, 1);
    grainSize = z.linlin(0,1, 0.01, 0.10);
    g.set(\triggerfreq, triggerFreq, \pos, position, \grainSize, grainSize);
}, '/position');

~effectMix = 0;
OSCdef(\airwheel, {
    |msg, time, addr, recvPort|
    var delta = msg[1];
    delta = delta/720;
    ~effectMix = (~effectMix + delta).clip(0,1);
    ~effectMix.postln;
    b.set(\mix, ~effectMix);
}, '/airwheel');


SynthDef(\test, {
    |freq = 400, amp = 0.2, modfreq = 40, outBus = 0|
    var mod, snd;
    mod = SinOsc.ar(modfreq, 0.1).range(-10, 10);
    snd = SinOsc.ar(freq + mod);
    Out.ar(outBus,  Splay.ar(snd * amp));
}).add;

SynthDef(\Reverb, {
    |inBus, mix = 0.5, room = 0.5, damp = 0.2|
    var snd = FreeVerb.ar(In.ar(inBus), mix, room, damp);
    Out.ar(0, snd);
}).add;

SynthDef(\granular, {
    |amp = 0.3, triggerFreq = 50, grainSize = 0.1, buffer, rate = 1, pos = 0, outBus = 0, pan=0|
    var snd;
    snd = GrainBuf.ar(1, Impulse.kr(10), grainSize, buffer, rate,
            pos, 2, pan, -1);
    Out.ar(outBus, snd);
}).add;


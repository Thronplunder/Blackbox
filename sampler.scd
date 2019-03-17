s.reboot;
x = 0.5;
y = 0.5;
z = 0.1;
~effectMix = 0;
~buf = Buffer.read(s, "~/sampler/samples/sample.wav".absolutePath);
"~/sampler/synthdefs.scd".absolutePath.load;
~effectBus = Bus.audio(s, 2)
//a = Synth.head(s, \test, [\outBus, ~effectBus]);
j = Synth.head(s, \granular, [\triggerFreq, 50, \grainSize, 0.1,\buffer, ~buf, \outBus, 0]);
b = Synth.after(j, \Reverb, [\inBus, ~effectBus]);
"~/sampler/oscdefs.scd".absolutePath.load;
v= {SinOsc.ar()}.play
Platform.userExtensionDir

SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
    Out.ar(out,
        GrainBuf.ar(1, Impulse.kr(10),0.1,  bufnum, BufRateScale.kr(bufnum), 0.3)
    )
}).play(s, [\out, 0, \bufnum, ~buf]);

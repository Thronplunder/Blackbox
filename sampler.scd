s.boot;
x = 0.5;
y = 0.5;
z = 0.1;
~effectMix = 0.5;
~buf = Buffer.readChannel(s, "/home/ale/Blackbox/samples/sample3.wav", 0, -1, 1);
"~/Blackbox/synthdefs.scd".absolutePath.load;
~effectBus = Bus.audio(s, 2)
//a = Synth.head(s, \test, [\outBus, ~effectBus]);
j = Synth.head(s, \granular, [\triggerFreq, 50, \grainSize, 0.1,\buffer, ~buf, \outBus, ~effectBus]);
b = Synth.after(j, \Reverb, [\inBus, ~effectBus]);
"~/sampler/oscdefs.scd".absolutePath.load;



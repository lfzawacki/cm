Mn n;
n.connect(dac);

//our major scale
[0,2,4,5,7,9,11,12] @=> int major[];

//harmonic minor
[0,2,3,5,7,8,11,12] @=> int harmonicminor[];

[2,2,3,4,4,3,2,1,
0,0,1,2,2,1,1 ] @=> int mel[];

//[0,1,2,4,1,2,4,7,6,5,4,3,2,1,0,1,2,3,4,5,6,7,1,2,3,1,2,3,1,2,3,0,1,2,0,1,2,0,1,2] @=> int mel[];

.3 => float noteTime;

while (true) {
	for ( 0 => int i; i < mel.size(); i++) {
		//starting from C
		n.note( 3 + major[ mel[i] ] );
		noteTime::second => now;
	}

	n.silence(dac,2::second);

	for ( 0 => int i; i < mel.size(); i++) {
		//starting from E
		n.note( 7 + harmonicminor[ mel[i] ] );
		noteTime::second => now;
	}

	n.silence(dac,2::second);
}

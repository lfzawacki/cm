//120 bmp
1::minute / 100 => dur score_tempo;

Mn n;

n.connect(dac);

//the melody
[7,7,7,3,7,10,-2 ]
/*,3,-2,-5,0,2,1,0]*/ @=> int mel[];

//the associated time values
[ [1,4],[1,2],[1,2],[1,4],[1,2],[1,1],[1,1],
[1,2],[1,2],[1,2],[1,2],[1,2],[1,4],[1,2] ] @=> int tempo[][];

while (true) {

	//play each part of the melody
	for (0 => int i; i < mel.size(); i++) {
		//play the note
		n.note( mel[i] );

		//wait for the tempo
		(tempo[i][0] / (tempo[i][1] $ float))::score_tempo => now;
	}

	//a little silence
	n.silence(dac,2::second);
}

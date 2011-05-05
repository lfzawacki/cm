//harmony to music.ck
//should modularize it and learn to use shreds

//120 bmp
1::minute / 100 => dur score_tempo;

Mn n;

n.connect(dac);

//the harmony
[-3,-3,-3,-3,-3,-2,-2 ]
/*,-5,-5,-9,-9,-7,-8,-9]*/ @=> int har[];

//the associated time values
[ [1,4],[1,2],[1,2],[1,4],[1,2],[1,1],[1,1],
[1,2],[1,2],[1,2],[1,2],[1,2],[1,4],[1,2] ] @=> int tempo[][];

while (true) {

	for (0 => int i; i < har.size(); i++) {
		n.note( har[i] );

		(tempo[i][0] / (tempo[i][1] $ float))::score_tempo => now;
	}

	n.silence(dac,2::second);
}

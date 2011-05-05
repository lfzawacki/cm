//our melody
[0,6,3,0,-2,0] @=> int melody[];

//the function to transpose it
//notice it's only epic
fun int transpose(int i) {
    if ( (i % 6) == 0 && i != 0)
        return i+1;
    else
        return i;
}

Mn n;
n.connect(dac);

while (true) {

    //the real melody with the evil tritone
    for (0 => int i; i < melody.size(); i++) {
        n.note( melody[i] );
        1::second => now;
    }

    //generate a silence of 2 seconds
    n.silence(dac,2::second);

    //the melody transposed
    for (0 => int i; i < melody.size(); i++) {
        n.note( transpose(melody[i]) );
        1::second => now;
    }

    n.silence(dac,2::second);
}


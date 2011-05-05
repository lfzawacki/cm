//our melody
[17,10,13,17,15,13,12,13,0,1,3] @=> int melody[];

//our transpositions
fun int onetoneup(int i) {
    return i+2;
}

fun int onetonedown(int i) {
    return i-2;
}

//this one is not an isomorphism!
fun int sameoctave(int i) {
    return i%12;
}

Mn n;
n.connect(dac);

while (true) {

    for (0 => int i; i < melody.size(); i++) {
        n.note( melody[i] );
        .5::second => now;
    }

    n.silence(dac,2::second);

    //the melody transposed several times
    for (0 => int i; i < melody.size(); i++) {
        n.note( onetoneup(melody[i]) );
        .5::second => now;
    }

    n.silence(dac,2::second);

    for (0 => int i; i < melody.size(); i++) {
        n.note( onetonedown(melody[i]) );
        .5::second => now;
    }

    n.silence(dac,2::second);

    for (0 => int i; i < melody.size(); i++) {
        n.note( sameoctave(melody[i]) );
        .5::second => now;
    }

    n.silence(dac,2::second);


}

